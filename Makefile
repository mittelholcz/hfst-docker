HFSTTAG = $$(cd hfst ; git describe --tags)


## build docker image
dbuild:
	docker build -t $${USER}/hfst:latest -t $${USER}/hfst:$(HFSTTAG) .
.PHONY: dbuild


## enter into the container
dshell:
	@docker run --rm -it $${USER}/hfst:latest sh
.PHONY: dshell


## show images and containers
dls:
	@echo 'IMAGES:'
	@docker image ls
	@echo
	@echo 'CONTAINERS:'
	@docker container ls
.PHONY: dls


## upload container to docker hub
drelease:
	docker login
	docker push $${USER}/hfst:$(HFSTTAG)
	docker logout
.PHONY: drelease


## delete unnecessary containers and images
dclean:
	@docker container prune -f
	@docker image prune -f
.PHONY: dclean
