#!/usr/bin/env bash

docker rmi jakzal/phpqa:php8.0
docker rmi jakzal/phpqa:php8.1
docker rmi jakzal/phpqa:php8.2

docker rmi hussainweb/drupalqa:php8.0
docker rmi hussainweb/drupalqa:php8.1
docker rmi hussainweb/drupalqa:php8.2
docker rmi hussainweb/drupalqa:latest
