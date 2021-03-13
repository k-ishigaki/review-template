# redpen-docker

[`redpen`](https://reviewml.org/ja/) executable via Docker

## Install

1. Build image
```sh
$ git clone https://github.com/k-ishigaki/redpen-docker.git
$ cd redpen-docker
$ docker build .
```
2. Prepare script file
```sh
$ echo 'docker exec -i --workdir $(pwd) redpen_container redpen $@' > ~/.local/bin/redpen
$ sudo chmod +x ~/.local/bin/redpen
```
3. Prepare $PATH<br>
Example of Ubuntu
```sh
$ echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.profile
$ source ~/.profile
```

## Usage

1. Run Docker container in background (Once after reboot)  note: `<host_dir>` and `<container_mount_dir>` must be same.
```sh
$ docker run -it -d \
        --name redpen_container \
        --mount type=bind,source=<host_dir>,target=<container_mount_dir> \
        <image_id>
```
2. Execute redpen!
```sh
$ redpen
```
