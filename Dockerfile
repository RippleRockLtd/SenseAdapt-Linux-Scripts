FROM mono:5

ENV MONO_ASPNET_WEBCONFIG_CACHESIZE 1024

RUN apt-get update \
    && apt-get install -y mono-complete mono-xsp4 wget unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/* \
    && mkdir -p /etc/mono/registry \
    && chmod uog+rw /etc/mono/registry \
    && wget -O ./SenseAdapt.zip http://downloads.senseadapt.com/trial91278/senseadaptlinuxlatest.zip \
    && unzip ./SenseAdapt.zip -d ./SenseAdapt\
    && rm -Rf ./SenseAdapt.zip \
    && apt-get purge -y unzip \
    && apt-get --purge autoremove \
    && apt-get clean \
    && apt-get autoclean

WORKDIR /SenseAdapt

ENTRYPOINT [ "xsp4" ]
CMD [ "--port", "80", "--nonstop" ]

