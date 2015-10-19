# Motion with RTSP
Motion with RTSP support

### Installation
1. Install Docker
2. Download the Dockerfile and build image.

```sh
$ git clone git@github.com:MatthiasGa/Motion-RTSP-Dockerfile.git
$ cd Motion-RTSP-Dockerfile
$ ./build-docker
```

### Usage

```sh
$ ./start-docker
```

```sh
$ cd data
$ cp motion-dist.conf motion.conf 
$ cp thread1-dist.conf thread1.conf
$ ...
```
