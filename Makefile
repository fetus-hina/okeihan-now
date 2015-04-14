docker: app.tar.gz
	sudo docker build -t jp3cki/okeihannow:latest .

docker-release: app.tar.gz
	sudo docker build -t jp3cki/okeihannow:release .

app.tar.gz: FORCE
	tar zcvf app.tar.gz \
		--exclude=public_html/protected/runtime \
		composer.json composer.lock LICENSE README.md yii public_html sqls

FORCE:
