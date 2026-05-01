# Build Stage
FROM golang:1.26.2-alpine AS build

WORKDIR /app

COPY ./services/go/go.mod .
COPY ./services/go/main.go .


RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

# Run Time Stage
FROM gcr.io/distroless/static-debian12


WORKDIR /app

ARG CREATED=unknown
COPY --from=build /app/app .
USER nonroot:nonroot

LABEL org.opencontainers.image.title="go-api" \
      org.opencontainers.image.description="GO API Service (distroless)" \
      org.opencontainers.image.created=$CREATED \
      org.opencontainers.image.source="https://github.com/zero-ralph/portfolio"

# EXPOSE 1233

CMD ["./app"]