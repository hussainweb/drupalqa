#!/usr/bin/env bash

dir=$(dirname $0)

set -ex

export DOCKER_BUILDKIT=1

docker pull jakzal/phpqa:php8.0
docker pull jakzal/phpqa:php8.1
docker pull jakzal/phpqa:php8.2

docker build -t hussainweb/drupalqa:php8.1 --build-arg PHP_VERSION=php8.1 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.2 --build-arg PHP_VERSION=php8.1 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.0 --build-arg PHP_VERSION=php8.0 ${dir}/8.x/debian/
docker tag hussainweb/drupalqa:php8.2 hussainweb/drupalqa:latest

docker push hussainweb/drupalqa:php8.0
docker push hussainweb/drupalqa:php8.1
docker push hussainweb/drupalqa:php8.2
docker push hussainweb/drupalqa:latest
