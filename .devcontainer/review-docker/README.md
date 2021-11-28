# review-docker

[`rake`](https://reviewml.org/ja/) executable via Docker

## Install

1. Prepare script file
```sh
$ echo 'docker exec -i --workdir $(pwd) ghcr.io/k-ishigaki/review-docker rake $@' > ~/.local/bin/rake
$ sudo chmod +x ~/.local/bin/rake
```
2. Prepare $PATH<br>
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
2. Execute Rake!
```sh
$ rake
```
