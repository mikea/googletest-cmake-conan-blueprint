FROM ubuntu
MAINTAINER mike.aizatsky@gmail.com

RUN apt-get update
RUN apt-get install -y build-essential cmake python-pip
RUN pip install conan

RUN mkdir /src /build /out
WORKDIR /build/

COPY conanfile.txt /src/
RUN conan install /src/ -s compiler=gcc -s compiler.libcxx=libstdc++11 --build

COPY . /src/
CMD cmake -G "Unix Makefiles" /src/ && \
    VERBOSE=1 CTEST_OUTPUT_ON_FAILURE=1 make all test
