# Static Analysis Tools for Drupal and PHP

[![Docker Pulls](https://img.shields.io/docker/pulls/hussainweb/drupalqa.svg)](https://hub.docker.com/r/hussainweb/drupalqa/)

[Docker image](https://hub.docker.com/r/hussainweb/drupalqa) providing static analysis tools for Drupal and PHP. This is based on the comprehensive [PHPQA image](https://github.com/jakzal/phpqa/) and adds Drupal specific sniffs and PAReview.

## Supported platforms and PHP versions

DockerHub repository: [https://hub.docker.com/r/hussainweb/drupalqa](https://hub.docker.com/r/hussainweb/drupalqa)

This image currently only supports Debian along with 8.0, 8.1, and 8.2. PHP 7.x images are available but no longer supported by the [upstream image](https://github.com/jakzal/phpqa/).

### Debian

- `php7.3` (_end of support_)
- `php7.4` (_end of support_)
- `php8.0` ([8.x/debian/Dockerfile](8.x/debian/Dockerfile))
- `php8.1` ([8.x/debian/Dockerfile](8.x/debian/Dockerfile))
- `php8.2` ([8.x/debian/Dockerfile](8.x/debian/Dockerfile))

## Available Tools

See [PHPQA's available tools](https://github.com/jakzal/phpqa/#available-tools) for a complete list of tools provided by that image. DrupalQA adds these tools:

- Drupal coder sniffs by the Drupal Coder module - [Checks for Drupal coding standards](https://www.drupal.org/project/coder)
- DrupalPractice coder sniffs by the Drupal Coder module - [Checks for best practices for Drupal](https://www.drupal.org/project/coder)
- DrupalSecure coder sniffs [outdated and will be removed]
- [PHPCompatibility coder sniffs](https://github.com/PHPCompatibility/PHPCompatibility)
- PAReview.sh - [Runs various Drupal sniffs in sequence](https://pareview.sh/)
- Drupal Check - [check for correctness, deprecation errors specifically for Drupal modules, and more](https://github.com/mglaman/drupal-check)

**NOTE**: Drupal coder sniffs requires additional dependencies which aren't loaded when PHPCS is run via PHAR module (as is the case with phpcs provided by the phpqa image). For this reason, we remove the phpcs PHAR file and install it using composer.

## Running tools

Pull the image:

```bash
docker pull hussainweb/drupalqa:latest
```

Read additional documentation in [phpqa's README](https://github.com/jakzal/phpqa/#running-tools).

To run the selected tool inside the container, you'll need to mount the project directory on the container with `-v $(pwd):/project`. Some tools like to write to the `/tmp` directory (like PHPStan, or Behat in some cases), therefore it's often useful to share it between docker runs, i.e. with `-v $(pwd)/tmp-phpqa:/tmp`. If you want to be able to interrupt the selected tool if it takes too much time to complete, you can use the `--init` option. Please refer to the [docker run documentation](https://docs.docker.com/engine/reference/commandline/run/) for more information.

```bash
docker run --init -it --rm -v $(pwd):/project -v $(pwd)/tmp-phpqa:/tmp -w /project hussainweb/drupalqa phpstan analyse web/modules/custom
```

## GitHub Action

You can run DrupalQA as part of your GitHub Actions workflow directly using the [associate action](https://github.com/hussainweb/drupalqa-action). Visit the [action page readme](https://github.com/hussainweb/drupalqa-action#readme) or the [marketplace page](https://github.com/marketplace/actions/drupalqa) to learn more.
