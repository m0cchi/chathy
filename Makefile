AUTHOR := kamochi
APP_NAME := chathy
ROOT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

clean-docker-image:
	docker image prune -f

build: clean-docker-image
	docker build -f docker/app.dockerfile -t $(AUTHOR)/$(APP_NAME):latest .

release: build
	$(eval VERSION := $(shell docker run -it $(AUTHOR)/$(APP_NAME):latest pipenv run hy -c '(import $(APP_NAME).version) (print $(APP_NAME).version.+VERSION+ :end "")'))
	docker build -f docker/app.dockerfile -t $(AUTHOR)/$(APP_NAME):$(VERSION) .
	git tag -a v$(VERSION) -m 'release v'$(VERSION)

version: build
	docker run -it $(AUTHOR)/$(APP_NAME):latest pipenv run hy -c '(import $(APP_NAME).version) (print $(APP_NAME).version.+VERSION+)'

debug: build
	docker run -it -e debug=True -e reloader=True -v $(ROOT_DIR):/opt/debug -w /opt/debug -p 13000:3000 $(AUTHOR)/$(APP_NAME):latest sh -c 'pipenv install && pipenv run hy app.hy'

debug-daemon: build
	docker run -d -e debug=True -e reloader=True -v $(ROOT_DIR):/opt/debug -w /opt/debug -p 13000:3000 $(AUTHOR)/$(APP_NAME):latest sh -c 'pipenv install && pipenv run hy app.hy'

run: build
	docker run -it -p 3000:3000 $(AUTHOR)/$(APP_NAME):latest

daemon: build
	docker run -d -p 3000:3000 $(AUTHOR)/$(APP_NAME):latest

