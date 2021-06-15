FROM php:7.3-alpine

RUN apk update && apk --no-cache add \
	curl

RUN rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN rm -rf composer-setup.php

RUN curl -sL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /usr/bin/phpcs \
	&& chmod a+x /usr/bin/phpcs
	
RUN curl -LsS https://codeception.com/codecept.phar -o /usr/bin/codecept \
	&& chmod a+x /usr/bin/codecept

ENV WORKDIR /data

WORKDIR /data

CMD ["php", "--version"]
