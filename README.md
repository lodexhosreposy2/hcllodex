# HCL

Hospices Civils de Lyon - Centre Hospitalier Universitaire

## Start the project

This project uses [LODEX](https://github.com/Inist-CNRS/lodex), a data visualization tool.

```bash
make fetch-latest-lodex
make custom-config
make setup-theme
make install-lodex
make start-lodex
```

## Update lodex version

```bash
make fetch-latest-lodex
make custom-config
make setup-theme
make install-lodex
make start-lodex
```

## Use a specific lodex version

You need to download the version you want to use from [LODEX releases](https://github.com/Inist-CNRS/lodex/releases) and unzip it in the `lodex` folder.

Then, run:

```bash
make custom-config
make setup-theme
make install-lodex
make start-lodex
```

## Update theme

```bash
make setup-theme
make start-lodex
```

## Update custom configuration

```bash
make custom-config
make start-lodex
```

## Deploy the project automatically (for testing)

Deployment could be automatically handled by GitHub Actions.
For that, remove the `if: false` and uncomment the `if: github.ref == 'refs/heads/main'` lines in `.github/workflows/deploy.yml` and set the following environment variables in the repository secrets.

```bash
SERVER_USER=user
SERVER_HOSTNAME=x.x.x.x
SERVER_PRIVATE_KEY=private_key
```

## Deploy the project manually

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

## Publish to DockerHub

### Push a publish commit

Publish a new image to DockerHub is automatically handled by GitHub Actions if `DOCKER_LOGIN` and `DOCKER_PASSWORD` are set in the repository secrets.

On the `main` branch, you can push a publish commit by running:

```bash
npm version x.y.z
```

### Publish manually

To publish manually, you need to set the following environment variables in `.secrets/.env`:

```bash
DOCKER_LOGIN=login
```

Make sure you have the latest lodex version and you have moved custom theme and custom config to lodex folder:

```bash
make fetch-latest-lodex
make custom-config
make setup-theme
```

You must be logged in to DockerHub:

```bash
docker login
```

Update the version in `package.json`.
Update `build` and `publish` commands in `Makefile`.

Then, run:

```bash
make publish
```
