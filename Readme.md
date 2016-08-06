# Docker Vault for automated testing  https://github.com/Voronenko/hashi_vault_utils

This Docker Vault container is using [Alpine Linux](https://hub.docker.com/_/alpine/) minimal image and [Hashicorp's Vault](https://vaultproject.io/).

The  latest build is always available at [voronenko/vault](https://registry.hub.docker.com/u/voronenko/vault/):

`docker pull voronenko/vault`

### Starting dev server

Start vault server in a **dev mode**:

```
docker run -d \
      -p 8200:8200 \
      --hostname vault \
      --name vault voronenko/vault
```

by default ROOT_TOKEN will be abfd0e04-7922-6850-e1bd-f02c325f1e2c

you can change it by passing environment variable  EXTERNAL_VAULT_TOKEN to container.
It is recommended to export this token as environment variable VAULT_TOKEN too.

To initialize Vault, on your workstation with `vault` installed, first we need to export vault ip address.
Use  `docker inspect -f '{{ .NetworkSettings.IPAddress }}' vault` command to get the vault container internal ip address.

You should export this address as VAULT_ADDR
```
# The address must start with protocol specifier!
export VAULT_ADDR='http://a.b.c.d:8200'
```

Note: this is dev vault image, thus the empty initialized and unsealed **inmem** vault data store will be automatically created each run.


To use a vault client from a container you can create a wrapper function like bellow:

```
vault () { docker run -it --rm -e VAULT_ADDR --entrypoint=/bin/sh voronenko/vault -c "vault auth $VAULT_TOKEN &>/dev/null; vault $*" }
```
