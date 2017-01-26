#!/bin/bash

set -e
set -o pipefail
set -x

GO_VERSION=1.7.4

function build_gopython() {
  cd /build

  # Download
  curl -LO https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz

  tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/work

  go get github.com/Sirupsen/logrus github.com/kelseyhightower/envconfig



  ## add the pc file
  cat << EOF > /build/Python-2.7.10/Misc/python-2.7.pc
Name: Python
Description: Python library
Requires:
Version: 2.7
Libs: -L/build/Python-2.7.10/ -lpython2.7 -lm -ldl -lutil -L/build/zlib-1.2.11 -lz -L/build/readline-6.3 -L/build/termcap-1.3.1 -lreadline -ltermcap -lreadline -ltermcap -L/build/openssl-1.0.2c -L/build/openssl-1.0.2c/crypto -lssl -lcrypto
Cflags: -I/build/Python-2.7.10 -I/build/Python-2.7.10/Include
EOF

  # install
  export PKG_CONFIG_PATH=/build/Python-2.7.10/Misc/
  CC='/opt/cross/x86_64-linux-musl/bin/x86_64-linux-musl-gcc -static -fPIC' go get -x github.com/sbinet/go-python

  # build
  cd /root/work/src/github.com/sbinet/go-python/
  CC='/opt/cross/x86_64-linux-musl/bin/x86_64-linux-musl-gcc' go build  -ldflags "-extldflags -static" cmd/go-python/main.go

}

function doit() {
    build_gopython

    echo "** Finished building go-python  **"
}

doit
