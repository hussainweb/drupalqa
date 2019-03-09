#!/usr/bin/env bash

dir=$(dirname $0)

set -ex

docker pull jakzal/phpqa:php7.1
docker pull jakzal/phpqa:php7.2
docker pull jakzal/phpqa:php7.3

docker build -t hussainweb/drupalqa:php7.1 ${dir}/7.1/debian/
docker build -t hussainweb/drupalqa:php7.2 ${dir}/7.2/debian/
docker build -t hussainweb/drupalqa:php7.3 ${dir}/7.3/debian/
docker build -t hussainweb/drupalqa:latest ${dir}

docker push hussainweb/drupalqa:php7.1
docker push hussainweb/drupalqa:php7.2
docker push hussainweb/drupalqa:php7.3
docker push hussainweb/drupalqa:latest
