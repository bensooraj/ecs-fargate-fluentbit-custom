# SAMPLE: https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db
# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

build: ## Build the container
	docker build -f Dockerfile -t ecs-fargate-fluentbit-custom:$(IMAGE_VERSION) .

build-nc: ## Build the container without caching
	docker build --no-cache -f Dockerfile -t ecs-fargate-fluentbit-custom:$(IMAGE_VERSION) .

publish:
	docker tag ecs-fargate-fluentbit-custom:$(IMAGE_VERSION) bensooraj/ecs-fargate-fluentbit-custom:$(IMAGE_VERSION)
	docker login -u=$(DOCKER_USERNAME) -p=$(DOCKER_PASSWORD)
	docker push bensooraj/ecs-fargate-fluentbit-custom:$(IMAGE_VERSION)