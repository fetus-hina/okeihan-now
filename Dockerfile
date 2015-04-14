FROM centos:7
MAINTAINER AIZAWA Hina "hina@bouhime.com"

# Systemd setup
RUN yum swap -y \
      -- remove systemd-container systemd-container-libs \
      -- install systemd systemd-libs; \
    yum -y update; \
    yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

# EPEL-repo and PostgreSQL-repo Setup
RUN curl -o /tmp/epel-release.rpm \
      http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm; \
    curl -o /tmp/pgsql94-release.rpm \
      http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm; \
    yum localinstall -y /tmp/epel-release.rpm /tmp/pgsql94-release.rpm; \
    rm -f /tmp/*.rpm

# HHVM-repo Setup
RUN curl -o /etc/yum.repos.d/no1youknowz-hhvm-repo-epel-7.repo \
      https://copr.fedoraproject.org/coprs/no1youknowz/hhvm-repo/repo/epel-7/no1youknowz-hhvm-repo-epel-7.repo

# NGINX-repo Setup
RUN echo "[nginx]" > /etc/yum.repos.d/nginx.repo; \
    echo "name=nginx repo" >> /etc/yum.repos.d/nginx.repo; \
    echo "baseurl=http://nginx.org/packages/mainline/centos/7/x86_64/" >> /etc/yum.repos.d/nginx.repo; \
    echo "gpgcheck=0" >> /etc/yum.repos.d/nginx.repo; \
    echo "enabled=1" >> /etc/yum.repos.d/nginx.repo;

# Install packages from additional repository
RUN yum -y install \
      yum-cron \
      nginx \
      hhvm hhvm-ext-pgsql \
      postgresql94 postgresql94-contrib postgresql94-libs postgresql94-server \
      uglify-js js-uglify nodejs-clean-css && \
    yum clean all && \
    systemctl enable yum-cron

# Setup application
RUN mkdir -p /var/www/sites; \
    useradd -d /var/www/sites/kh.fetus.jp alice; \
    chown alice:alice /var/www/sites/kh.fetus.jp; \
    chmod 701 /var/www/sites/kh.fetus.jp;
USER alice
ADD app.tar.gz /var/www/sites/kh.fetus.jp
WORKDIR /var/www/sites/kh.fetus.jp
RUN chown -R alice:alice .; \
    mkdir -p public_html/protected/runtime; \
    chmod 777 public_html/protected/runtime; \
    curl -sS "https://getcomposer.org/installer" | hhvm --php; \
    hhvm --php composer.phar install
USER root
WORKDIR /

# Setup PostgreSQL data
RUN systemctl enable postgresql-9.4.service
USER postgres
RUN /usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/9.4/data -E UTF-8
ADD docker/createdb.sh /tmp/createdb.sh
RUN bash /tmp/createdb.sh
USER root
RUN rm -rf /tmp/sqls /tmp/createdb.sh

# Setup NGINX
ADD docker/nginx.conf /etc/nginx/nginx.conf
RUN systemctl enable nginx.service

# Setup HHVM
RUN echo "hhvm.dynamic_extensions[pgsql] = pgsql.so" >> /etc/hhvm/php.ini; \
    systemctl enable hhvm.service

