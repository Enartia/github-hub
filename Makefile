IMAGE_NAME := papaki/github-hub
HUB_VERSION := 2.14.2
IMAGE_PATH := ""

build:
	docker build -t $(IMAGE_NAME):latest . --build-arg HUB_VERSION=$(HUB_VERSION)

run:
	docker run -ti $(IMAGE_NAME):latest hub version

test:
	docker run -ti $(IMAGE_NAME):latest hub version | grep "hub version $(HUB_VERSION)"

save:
	docker save -o $(IMAGE_PATH)image.tar $(IMAGE_NAME)

load:
	docker load -i $(IMAGE_PATH)image.tar

publish:
	git tag $HUB_VERSION -f
	git push -q https://$(GITHUB_USER):$(GITHUB_TOKEN)@github.com/Enartia/github-hub.git $(HUB_VERSION) -f
	echo "$(DOCKER_HUB_PASSWORD)" | docker login -u "$(DOCKER_HUB_USER)" --password-stdin
	docker tag $(IMAGE_NAME):latest $(IMAGE_NAME):$(HUB_VERSION)
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(HUB_VERSION)