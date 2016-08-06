
FROM alpine:latest
MAINTAINER Vyacheslav Voronenko , originally cloned from https://github.com/sjourdan/docker-vault
ENV REFRESHED_AT 2016-06-21
ENV VAULT_VERSION 0.6.0
ENV EXTERNAL_VAULT_TOKEN abfd0e04-7922-6850-e1bd-f02c325f1e2c

# x509 expects certs to be in this file only.
RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

# Download, unzip the given version of vault and set permissions
RUN wget -qO /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
      unzip -d /bin /tmp/vault.zip && rm /tmp/vault.zip && chmod 755 /bin/vault

RUN echo $EXTERNAL_VAULT_TOKEN > ~/.vault-token

EXPOSE 8200

ENTRYPOINT ["/bin/vault"]
CMD ["server", "-dev-listen-address=0.0.0.0:8200", "-dev", "-dev-root-token-id=$EXTERNAL_VAULT_TOKEN"]
