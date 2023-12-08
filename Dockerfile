FROM pandoc/latex
WORKDIR /src
COPY composer.* ./

# Install composer, refer: https://github.com/geshan/docker-php-composer-alpine/blob/master/Dockerfile
RUN apk update && \
    apk --update add wget \ 
		     curl \
		     git \
		     php7 \
		     php7-curl \
		     php7-openssl \
		     php7-iconv \
		     php7-json \
		     php7-mbstring \
		     php7-phar \
             php7-xml \
			 php7-simplexml \
		     php7-dom --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 
# end of install composer

RUN composer install
COPY . .
CMD ["sh"]
