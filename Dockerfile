FROM php:8.1-cli

RUN apt update && apt install -y git unzip
RUN apt autoremove

RUN cd ~ \
    && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && HASH=`curl -sS https://composer.github.io/installer.sig` \
    && echo $HASH \
    && php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && composer

RUN composer global require marcocesarato/php-conventional-changelog:^1.13.0 

ENV PATH="~/.composer/vendor/bin:${PATH}"

RUN mkdir -p /codebase
WORKDIR /codebase
CMD ["/root/.composer/vendor/bin/conventional-changelog"]
