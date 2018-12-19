FROM jakzal/phpqa:php7.2

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
RUN rm /usr/local/bin/phpcs && \
    ln -s $TARGET_DIR/vendor/bin/phpcs /usr/local/bin && \
    ln -s $TARGET_DIR/pareviewsh/pareview.sh /usr/local/bin/pareview && \
    chmod +x /usr/local/bin/pareview

RUN phpcs --config-set installed_paths $TARGET_DIR/vendor/drupal/coder/coder_sniffer/,$TARGET_DIR/drupalsecure

CMD php /usr/local/bin/tools.php list
