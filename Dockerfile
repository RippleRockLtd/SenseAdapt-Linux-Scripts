FROM mono:5

ENV MONO_VERSION 5.0.0.100

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y mono-complete mono-xsp4 \
    && apt-get purge -y apt-utils \
    && rm -rf /var/lib/apt/lists/* /tmp/* \
    && mkdir -p /etc/mono/registry \
    && chmod uog+rw /etc/mono/registry

WORKDIR /SenseAdapt

COPY ./SenseAdapt ./

ENTRYPOINT [ "xsp4" ]
CMD [ "--port", "80", "--nonstop" ]

