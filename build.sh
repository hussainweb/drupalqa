#!/usr/bin/env bash

dir=$(dirname $0)

set -ex

export DOCKER_BUILDKIT=1

docker pull jakzal/phpqa:php8.0
docker pull jakzal/phpqa:php8.1
docker pull jakzal/phpqa:php8.2
docker pull jakzal/phpqa:php8.3
docker pull jakzal/phpqa:php8.4
docker pull jakzal/phpqa:php8.5

docker build -t hussainweb/drupalqa:php8.0 --build-arg PHP_VERSION=php8.0 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.1 --build-arg PHP_VERSION=php8.1 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.2 --build-arg PHP_VERSION=php8.2 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.3 --build-arg PHP_VERSION=php8.3 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.4 --build-arg PHP_VERSION=php8.4 ${dir}/8.x/debian/
docker build -t hussainweb/drupalqa:php8.5 --build-arg PHP_VERSION=php8.5 ${dir}/8.x/debian/
docker tag hussainweb/drupalqa:php8.5 hussainweb/drupalqa:latest

docker push hussainweb/drupalqa:php8.0
docker push hussainweb/drupalqa:php8.1
docker push hussainweb/drupalqa:php8.2
docker push hussainweb/drupalqa:php8.3
docker push hussainweb/drupalqa:php8.4
docker push hussainweb/drupalqa:php8.5
docker push hussainweb/drupalqa:latest
