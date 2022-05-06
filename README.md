# Docker ARG/ENV playground

I've created a playground to see how ARG and ENV work in Docker.

These are the rules I've used dduringg testing:

- *empty string*: value is empty string
- `-1`: env variable not found
- `/^[0-9]$/`: value set in from Dockerfile
- `/^1[0-9]$/`: value from build arguments
- `/^2[0-9]$/`: value set in external environment e.g in docker-compose

[Dockerfile](./Dockerfile)

## Docker runtimes

I've tried it with plain Docker and [docker-compose](https://docs.docker.com/compose/environment-variables/).
I was able to achieve the same things.

### Docker

```bash
docker build \
    --build-arg ARG_WITH_DEFAULT=11 \
    --build-arg ARG_WITHOUT_DEFAULT=12 \
    -t argenv .

docker run \
    --rm \
    --name argenv \
    -e EXTERNAL_ENV_ENV=21 \
    argenv

# ARG_WITH_DEFAULT: -1
# ARG_WITHOUT_DEFAULT: -1
# ARG_UNSET_OUTSIDE: -1
# ENV_WITH_DEFAULT: 2
# ENV_ARG_WITH_DEFAULT: 11
# ENV_ARG_WITHOUT_DEFAULT: 12
# ENV_ARG_UNSET_OUTSIDE: 
# ENV_ARG_UNSET_OUTSIDE_WITH_DEFAULT: 3
# EXTERNAL_ENV_ENV: 21
```

### Docker-compose

[compose.yml](./compose.yml)

```bash
docker-compose up --build

# ARG_WITH_DEFAULT: -1
# ARG_WITHOUT_DEFAULT: -1
# ARG_UNSET_OUTSIDE: -1
# ENV_WITH_DEFAULT: 2
# ENV_ARG_WITH_DEFAULT: 11
# ENV_ARG_WITHOUT_DEFAULT: 12
# ENV_ARG_UNSET_OUTSIDE: 
# ENV_ARG_UNSET_OUTSIDE_WITH_DEFAULT: 3
# EXTERNAL_ENV_ENV: 21
```

## Takeaways

- ARG is available during build
- ARG can be set as `--build-arg` in docker or `build/args` in docker-compose
- ENV can not be set during build externally
- ENV can be set to ARG values
- ENV can be set during runtime with `--env` in docker and `environment` in docker-compose

![env vs arg in build and runtime](./assets/docker_environment_build_args.png)

Image source and inspiration: [read more here](https://vsupalov.com/docker-arg-env-variable-guide/)