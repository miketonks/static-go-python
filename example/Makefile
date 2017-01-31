IMAGE = flexer_py27
VERSION = $(shell python -c "from tag_versioner.version_reader import VersionReader; print VersionReader('$(IMAGE_NAME)-').get_docker_version()")
BUILD_CONTEXT := .
VERSION_FILE = $(BUILD_CONTEXT)/current_version
DOCKER_REGISTRY = containers.bespin.nboss.ntt.net:9500

# build the go binary
.PHONY: build
build: ## Build the static binary using dockerised toolchain
	@echo "Build static go binary"
	docker run -v `pwd`:/build/example miketonks/static-go-python:latest /build/example/build.sh

.PHONY: run
run:
	PYTHONPATH=python-libs.zip ./go-python
