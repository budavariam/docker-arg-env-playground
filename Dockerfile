FROM python:3.9
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY ./src /app

ARG ARG_WITH_DEFAULT=1
ARG ARG_WITHOUT_DEFAULT
ARG ARG_UNSET_OUTSIDE

ENV ENV_WITH_DEFAULT=2

ENV ENV_ARG_WITH_DEFAULT=${ARG_WITH_DEFAULT}
ENV ENV_ARG_WITHOUT_DEFAULT=${ARG_WITHOUT_DEFAULT}
ENV ENV_ARG_UNSET_OUTSIDE=${ARG_UNSET_OUTSIDE}
ENV ENV_ARG_UNSET_OUTSIDE_WITH_DEFAULT=${ARG_UNSET_OUTSIDE:-3}

ENV EXTERNAL_ENV_ENV=3

CMD [ "python", "/app/main.py" ]