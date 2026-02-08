# Pin to a specific version digest for reproducibility and security
FROM busybox:1.36.1@sha256:6d9ac9237a84afe1516540f40a0fafdc86859b2141954b4d643af7066d598b74

# Define root directory
ENV ROOT=/kubernetes

# Create app directory
RUN mkdir -p $ROOT
WORKDIR $ROOT

# Copy app dependencies
COPY build $ROOT/

CMD ["/bin/sh"]
