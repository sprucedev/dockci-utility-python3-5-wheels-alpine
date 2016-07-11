FROM alpine:3.4

RUN apk add --update \
    ca-certificates gcc musl-dev \
    python3=3.5.1-r3 python3-dev=3.5.1-r3 \
    && rm -rf /var/cache/apk/*
RUN easy_install-3.5 pip==8.1.2 wheel==0.29.0

WORKDIR /work

CMD ["pip", "wheel", "-r", "requirements.txt"]
