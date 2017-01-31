FROM andrewd/musl-cross
MAINTAINER Mike Tonks

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/*

# Add our build script
ADD . /build/

# build everything inside the image
RUN /build/build_libraries.sh
RUN /build/build_gopython.sh

# This builds the program and copies it to /output
CMD echo "add your build script here"
