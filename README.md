# [Re:VIEW](https://reviewml.org/ja/) Publishing Environment

## Requrements

- Docker
- Docker Compose (Version 1.21 or above)

## Setup

```bash
$ docker-compose up -d
```

## Build

```bash
$ docker-compose exec tmux fish
$ cd src
$ rake pdf
```

## Edit

```bash
$ docker-compose exec tmux fish
$ nvim src/preface.re
```

## Uninstall

```bash
$ docker-compose down --rmi all --volume
```
