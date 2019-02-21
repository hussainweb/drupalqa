FROM jakzal/phpqa:php7.3

LABEL maintainer="hussainweb@gmail.com"

ENV TARGET_DIR="/usr/local/lib/drupalqa"

WORKDIR ${TARGET_DIR}

# PAReview needs the file command.
RUN apt-get update && \
    apt-get install -y file

RUN composer require --prefer-dist "squizlabs/php_codesniffer:^3.3" "drupal/coder:dev-8.x-2.x" && \
    git clone http://git.drupal.org/sandbox/coltrane/1921926.git drupalsecure && \
    git clone https://github.com/klausi/pareviewsh.git

# Let's remove the phpcs installed by phpqa as it cannot
# autoload classes required in Drupal code sniffs.
RUN rm $TOOLBOX_TARGET_DIR/phpcs && \
    ln -s $TARGET_DIR/vendor/bin/phpcs $TOOLBOX_TARGET_DIR && \
    ln -s $TARGET_DIR/pareviewsh/pareview.sh $TOOLBOX_TARGET_DIR/pareview && \
    chmod +x $TOOLBOX_TARGET_DIR/pareview

RUN phpcs --config-set installed_paths $TARGET_DIR/vendor/drupal/coder/coder_sniffer/,$TARGET_DIR/drupalsecure

CMD php $TOOLBOX_TARGET_DIR/toolbox list-tools
