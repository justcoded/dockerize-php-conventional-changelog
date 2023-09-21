# Quick reference

* **Conventional Commits**  
  https://www.conventionalcommits.org/
* **SemVer**  
  https://semver.org/
* **PHP Conventional Changelog**  
  https://github.com/marcocesarato/php-conventional-changelog

# What is Conventional Changelog

This docker image is based on [PHP 8.1 CLI](https://hub.docker.com/_/php) with
additional `composer` and global `marcocesarato/php-conventional-changelog` package
installed inside.

You can run this image directly to generate nice CHANGELOG.md file inside your git
working directory.

This image doesn't suppose to commit/push anything (in opposite that main package supports
these features). Usually in our practice we need to verify generated changelog 
before committing it to the repository, and tags are created from GitHub or BitBucket
user interface.

# How to use this image

## Run a single generator

If you already have `CHANGELOG.md` file and tags and you want to generate next release
notes you can simply run such command:

```bash
$ docker run -it --rm --name conventional-changelog -v "$PWD":/codebase  ghcr.io/justcoded/php-conventional-changelog
```

## Specify additional parameters

In case you want to customize generator parameters and specify config file or 
`--first-release` option, then you should run image as follows:

```bash
$ docker run -it --rm --name conventional-changelog -v "$PWD":/codebase  ghcr.io/justcoded/php-conventional-changelog bash -c "conventional-changelog --first-release" 
```
