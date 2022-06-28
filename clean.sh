#!/usr/bin/env bash

docker rmi jakzal/phpqa:php7.4
docker rmi jakzal/phpqa:php8.0
docker rmi jakzal/phpqa:php8.1

docker rmi hussainweb/drupalqa:php7.4
docker rmi hussainweb/drupalqa:php8.0
docker rmi hussainweb/drupalqa:php8.1
docker rmi hussainweb/drupalqa:latest
