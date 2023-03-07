# HCL

Hospices Civils de Lyon - Centre Hospitalier Universitaire

## Start the project

This project uses [LODEX](https://github.com/Inist-CNRS/lodex), a data visualization tool.

```bash
make fetch-latest-lodex
make install-lodex
make start-lodex
```

## Deploy the project

Deployment is automatically handled by GitHub Actions.

To deploy manually, you need to set the following environment variables in `.secrets/.env`:

```bash
SERVER_USER=user
SERVER_HOSTNAME=x.x.x.x
```

You also need to store the SSH private key in `.secrets/hcl.pem`.

Then, run:

```bash
make production-deploy
```

This command is copying the `Makefile`, the `docker-compose.yml`, `config.json` and the `run-production.sh` files to the server, and then run `run-production.sh` on the server which fetch latest lodex release, copy custom configuration files and HCL theme, build and start the project.

To restart containers on your server, run:

```bash
make start-prod
```
