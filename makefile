up:

down:


lint:
	golangci-lint run --timeout=5m
	gofmt -e -d -l .
	ruff check
	terraform fmt
	detect-secrets scan > .secrets.baseline

deploy:
