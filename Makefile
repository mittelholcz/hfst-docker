## build docker image
dbuild:
	@docker build -t hfst:latest .
.PHONY: dbuild


## enter into the container
dshell:
	@docker run --rm -it hfst:latest sh
.PHONY: dshell


## show images and containers
dls:
	@echo 'IMAGES:'
	@docker image ls
	@echo
	@echo 'CONTAINERS:'
	@docker container ls
.PHONY: dls