all: public_html/favicon.ico

docker: app.tar.gz
	sudo docker build -t jp3cki/okeihannow:latest .

docker-release: app.tar.gz
	# sudo docker build --no-cache -t jp3cki/okeihannow:release .
	sudo docker build -t jp3cki/okeihannow:release .

app.tar.gz: FORCE
	tar zcvf app.tar.gz \
		--exclude=public_html/protected/runtime \
		composer.json composer.lock LICENSE README.md yii public_html sqls

public_html/favicon.ico: public_html/protected/runtime/favicon.gif
	convert public_html/protected/runtime/favicon.gif -background transparent -gravity west -splice 4x0 -gravity east -splice 4x0 public_html/favicon.ico

public_html/protected/runtime/favicon.gif:
	curl 'http://www.trainfrontview.net/p/khan8004.gif' -o public_html/protected/runtime/favicon.gif

FORCE:
