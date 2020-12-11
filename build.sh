#!/usr/bin/env bash

dir=$(dirname $0)

set -ex

export DOCKER_BUILDKIT=1

docker pull jakzal/phpqa:php7.3
docker pull jakzal/phpqa:php7.4
docker pull jakzal/phpqa:php8.0

docker build -t hussainweb/drupalqa:php7.3 --build-arg PHP_VERSION=php7.3 ${dir}/7.3/debian/
docker build -t hussainweb/drupalqa:php7.4 --build-arg PHP_VERSION=php7.4 ${dir}/7.4/debian/
docker build -t hussainweb/drupalqa:php8.0 --build-arg PHP_VERSION=php8.0 ${dir}/7.4/debian/
docker tag hussainweb/drupalqa:php8.0 hussainweb/drupalqa:latest

docker push hussainweb/drupalqa:php7.3
docker push hussainweb/drupalqa:php7.4
docker push hussainweb/drupalqa:php8.0
docker push hussainweb/drupalqa:latest
