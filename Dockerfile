FROM docker:19.03.8-git

RUN apk --no-cache add python2-dev py-pip

RUN python -m pip install -U pip

RUN apk --no-cache add linux-headers rsync bash gcc libc-dev libffi-dev openssl-dev make curl

RUN pip --no-cache-dir install docker-compose

ENV KUBECTL_VERSION=v1.18.0

ADD https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl && \
    kubectl version  --client
