FROM golang:1.25.9-bookworm AS build

WORKDIR /app

RUN apt-get update && apt-get install -y git

COPY ./services/go.mod ./
COPY ./services/go.sum ./
RUN go mod tidy

COPY ./services /app

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app ./api_gateway/cmd/server


FROM alpine:3.20

WORKDIR /app

RUN adduser -D appuser

COPY --from=build /app/app .
USER appuser

EXPOSE 1233

CMD ["./app"]