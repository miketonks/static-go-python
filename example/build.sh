#!/bin/bash

set -e
set -o pipefail
set -x

function build() {

  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/work

  cd /build/example
  CC='/opt/cross/x86_64-linux-musl/bin/x86_64-linux-musl-gcc' go build  -ldflags "-extldflags -static" go-python.go

  cp /build/python-libs.zip ./
}

function doit() {
    build
    echo "** Finished building go-python  **"
}

doit
