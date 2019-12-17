#!/usr/bin/env bash

set -ex

docker rmi jakzal/phpqa:php7.1
docker rmi jakzal/phpqa:php7.2
docker rmi jakzal/phpqa:php7.3
docker rmi jakzal/phpqa:php7.4

docker rmi hussainweb/drupalqa:php7.1
docker rmi hussainweb/drupalqa:php7.2
docker rmi hussainweb/drupalqa:php7.3
docker rmi hussainweb/drupalqa:php7.4
docker rmi hussainweb/drupalqa:latest
