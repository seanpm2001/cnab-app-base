# Cloud Native Application Bundle (CNAB) for Docker App

A cnab-app-base docker image is needed by docker-app in order to execute any basic action (bundle, install, upgrade, uninstall, inspect...)

Unfortunately, only x86-64 cnab-app-base is supported so far on official docker hub, see [docker/cnab-app-base](https://hub.docker.com/r/docker/cnab-app-base)

To be able to run docker-app on Toradex boards, we need build a local cnab-app-base, reference: [docker-app #461](https://github.com/docker/app/issues/461)


# How to build

Firstly you need get a cnab-run binary by `bitbake docker-app` in Torizon platform, and find it in ${DEPLOY_DIR_IMAGE} directory.

Then copy cnab-run to the top directory of this project, and run:

On armv7 boards:

```
$ docker build --rm --tag=torizon/arm32v7-cnab-app-base:${DOCKER_APP_VERSION} .
```

On aarch64 boards:

```
$ docker build --rm --tag=torizon/arm64v8-cnab-app-base:${DOCKER_APP_VERSION} .
```

in which, DOCKER_APP_VERSION should match docker-app version tag, which could be get by running the following command in docker-app source:
```
$ git describe --always --abbrev=10
```
