up:

down:


lint:
	golangci-lint run --timeout=5m
	gofmt -e -d -l .
	ruff check
	terraform fmt
	detect-secrets scan > .secrets.baseline

deploy:


scan:
	trivy image -o trivy-report-go.html go_service:latest
	trivy image -o trivy-report-python.html python_service:latest

build_go_dockerfile:
	docker buildx build -f infra/docker/go/Dockerfile --build-arg CREATED=$(date -u +%Y-%m-%dT%H:%M:%SZ) -t go_service .

build_python_dockerfile:
	docker buildx build -f infra/docker/python/Dockerfile --build-arg CREATED=$(date -u +%Y-%m-%dT%H:%M:%SZ) -t python_service .

