all: depends web/favicon.ico

composer.phar:
	curl -sS https://getcomposer.org/installer | php

depends: composer.phar
	./composer.phar install

web/favicon.ico: runtime/favicon.gif
	convert runtime/favicon.gif -background transparent -gravity west -splice 4x0 -gravity east -splice 4x0 web/favicon.ico

runtime/favicon.gif:
	curl 'http://www.trainfrontview.net/p/khan8004.gif' -o runtime/favicon.gif

.PHONY: all depends
