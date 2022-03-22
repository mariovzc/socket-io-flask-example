PACKAGE_NAME=sockets
HOST_PORT=8000
PROJECT_FOLDER=.
GIT_DIR=$(shell pwd)

build: 
	docker build -t $(PACKAGE_NAME) -f Dockerfile --build-arg module_folder=$(PROJECT_FOLDER) --build-arg package_name=$(PACKAGE_NAME) $(GIT_DIR)

launch:
	FLASK_APP=server.py FLASK_DEBUG=1 python -m flask run --host=0.0.0.0 --port=$(HOST_PORT)


shell:
	docker run -it --rm \
	-v $(GIT_DIR):/app \
	-p $(HOST_PORT):8000 \
	-w /app/$(PROJECT_FOLDER) \
	--entrypoint=/bin/ash $(PACKAGE_NAME)

