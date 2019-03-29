HFSTTAG = hfst-$$(cd hfst ; git describe --tags)


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


## delete unnecessary containers and images
dclean:
	@docker container prune -f
	@docker image prune -f
.PHONY: dclean


## push to github repo, trigger autobuild on dockerhub
release:
	@if [ "$$(git status --porcelain)" ] ; then \
		echo 'ERROR: working tree are not clean! Exit.' ; \
		exit 1; \
	fi
	git checkout -b $(HFSTTAG)
	git merge master
	git push origin $(HFSTTAG)
	git checkout master
	git branch -D $(HFSTTAG)
.PHONY: release
