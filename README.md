# [Re:VIEW](https://reviewml.org/ja/) Publishing Environment

## Requrements

- [Docker Desktop for Windows / Mac](https://www.docker.com/products/docker-desktop)

## Setup

```bash
$ docker-compose up -d
```

## Build

```bash
$ docker-compose exec main bash
$ make
```

## Edit

```bash
$ docker-compose exec main bash
$ nvim src/preface.re
```

## Uninstall

```bash
$ docker-compose down --rmi all --volume
```
