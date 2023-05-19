FROM debian

ENV PATH=/graalvm/bin:$PATH
ENV JAVA_HOME=/graalvm
ENV GRAALVM_HOME=/graalvm

RUN apt-get update && \
    apt-get install -y curl gcc zlib1g-dev && \
    export VERSION=22.3.2 && \
    curl -k -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-$VERSION/graalvm-ce-java17-linux-amd64-$VERSION.tar.gz | tar -xz && \
    mv graalvm-ce-java17-$VERSION graalvm && \
    gu install native-image

CMD java --version