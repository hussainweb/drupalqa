ARG PHP_VERSION=php8.3
FROM jakzal/phpqa:${PHP_VERSION}

LABEL maintainer="hussainweb@gmail.com"

ENV TARGET_DIR="/usr/local/lib/drupalqa"

WORKDIR ${TARGET_DIR}

# PAReview needs the file command. Also install other dependencies.
RUN apt-get update \
    && apt-get install --no-install-recommends -y pkg-config \
    && apt-get install --no-install-recommends -y \
        autoconf \
        build-essential \
        file \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd -j$(nproc) \
    && apt-get remove -y autoconf build-essential libfreetype6-dev libjpeg62-turbo-dev libpng-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN echo '{"minimum-stability": "dev", "prefer-stable": true}' > composer.json && \
    composer config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true && \
    composer require --prefer-dist \
        "squizlabs/php_codesniffer:^4.0" \
        "drupal/coder:^9.0" \
        "phpcompatibility/php-compatibility:^10.0" \
        "slevomat/coding-standard:^8.23" \
    && \
    git clone https://github.com/klausi/pareviewsh.git && \
    rm -rf ./pareviewsh/.git/

# Let's remove the phpcs/phpcbf installed by phpqa as it cannot
# autoload classes required in Drupal code sniffs.
RUN rm $TOOLBOX_TARGET_DIR/phpcs && \
    rm $TOOLBOX_TARGET_DIR/phpcbf && \
    ln -s $TARGET_DIR/vendor/bin/phpcs $TOOLBOX_TARGET_DIR && \
    ln -s $TARGET_DIR/vendor/bin/phpcbf $TOOLBOX_TARGET_DIR && \
    ln -s $TARGET_DIR/pareviewsh/pareview.sh $TOOLBOX_TARGET_DIR/pareview && \
    chmod +x $TOOLBOX_TARGET_DIR/pareview && \
    phpcs --config-set installed_paths $TARGET_DIR/vendor/drupal/coder/coder_sniffer/,$TARGET_DIR/vendor/phpcompatibility/php-compatibility,$TARGET_DIR/vendor/slevomat/coding-standard/

COPY tool-* /

RUN php $TOOLBOX_TARGET_DIR/toolbox install \
  --tools=/tool-drupal-check.json \
  --tools=/tool-grumphp.json \
  && rm -rf $COMPOSER_HOME/cache

CMD php $TOOLBOX_TARGET_DIR/toolbox list-tools
