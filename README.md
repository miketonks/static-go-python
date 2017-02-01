# static-go-python

This repository contains the tools to build a static go-python binary, using musl, with openssl and various other requirements.

It borrows heavily from https://github.com/andrew-d/static-binaries and of course https://github.com/sbinet/go-python

Build is fully automated via docker containers, making it easy to reproduce on any platform and integrate with build systems such as Jenkins.

## example

In the /example folder there is a basic build script and Makefile to build a simple go-python binary.

```bash
make build
make run
```
