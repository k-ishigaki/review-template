# review-docker

[`rake`](https://reviewml.org/ja/) executable via Docker

## Install

1. Build image
```sh
$ git clone https://github.com/k-ishigaki/review-docker.git
$ cd review-docker
$ docker build .
```
2. Prepare script file
```sh
$ echo 'docker exec -i --workdir $(pwd) review_container rake $@' > ~/.local/bin/rake
$ sudo chmod +x ~/.local/bin/rake
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
        --name review_container \
        --mount type=bind,source=<host_dir>,target=<container_mount_dir> \
        <image_id>
```
2. Execute rake!
```sh
$ rake
```
