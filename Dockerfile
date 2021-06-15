FROM php:7.3-alpine

RUN apk --no-cache add curl

RUN curl -sS https://getcomposer.org/installer | php -- \
	--install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer

RUN curl -LsS https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar --create-dirs -o /usr/bin/phpcs/phpcs.phar \
	&& chmod +x /usr/bin/phpcs/phpcs.phar
	
RUN curl -LsS https://codeception.com/codecept.phar -o /usr/bin/codecept \
	&& chmod a+x /usr/bin/codecept

ENV WORKDIR /data

WORKDIR /data

ENTRYPOINT ["composer"]

CMD ["--version"]
