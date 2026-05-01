# Build Stage
FROM python:3.12-slim AS build

WORKDIR /app

COPY ./services/python/ /app/

RUN pip install --no-cache-dir --prefix=/install .

# Run Time Stage
FROM gcr.io/distroless/python3

WORKDIR /app

ARG CREATED=unknown

COPY --from=build /install /usr/local
COPY --from=build /app /app

ENV PYTHONPATH=/usr/local/lib/python3.12/site-packages:/app

USER nonroot:nonroot

LABEL org.opencontainers.image.title="python-worker" \
      org.opencontainers.image.description="Python Worker Service (distroless)" \
      org.opencontainers.image.created=$CREATED \
      org.opencontainers.image.source="https://github.com/zero-ralph/portfolio"


CMD ["/usr/local/bin/app"]