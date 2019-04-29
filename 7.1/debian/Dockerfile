FROM jakzal/phpqa:php7.1

LABEL maintainer="hussainweb@gmail.com"

ENV TARGET_DIR="/usr/local/lib/drupalqa"
ENV DRUPAL_CHECK_VERSION="1.0.8"

WORKDIR ${TARGET_DIR}

# PAReview needs the file command.
RUN apt-get update && \
    apt-get install -y file

RUN composer require --prefer-dist "squizlabs/php_codesniffer:^3.3" "drupal/coder:dev-8.x-2.x" && \
    git clone https://git.drupalcode.org/sandbox/coltrane-1921926.git drupalsecure && \
    git clone https://github.com/klausi/pareviewsh.git && \
    rm -rf ./drupalsecure/.git/ ./pareviewsh/.git/ && \
    curl -Ls https://github.com/mglaman/drupal-check/releases/download/$DRUPAL_CHECK_VERSION/drupal-check.phar -o $TOOLBOX_TARGET_DIR/drupal-check && chmod +x $TOOLBOX_TARGET_DIR/drupal-check

# Let's remove the phpcs installed by phpqa as it cannot
# autoload classes required in Drupal code sniffs.
RUN rm $TOOLBOX_TARGET_DIR/phpcs && \
    ln -s $TARGET_DIR/vendor/bin/phpcs $TOOLBOX_TARGET_DIR && \
    ln -s $TARGET_DIR/pareviewsh/pareview.sh $TOOLBOX_TARGET_DIR/pareview && \
    chmod +x $TOOLBOX_TARGET_DIR/pareview && \
    phpcs --config-set installed_paths $TARGET_DIR/vendor/drupal/coder/coder_sniffer/,$TARGET_DIR/drupalsecure

CMD php $TOOLBOX_TARGET_DIR/toolbox list-tools
