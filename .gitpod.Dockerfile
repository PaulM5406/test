FROM dwavesys/leapide:latest-v2-prod

USER root

# install system packages
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        clang \
        libboost-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# install system-wide python package
RUN pip install --no-cache-dir \
        dwave-ocean-sdk==4.0.0 \
    && rm -rf /tmp/*