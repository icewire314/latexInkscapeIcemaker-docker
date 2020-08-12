NS = icewire314
REPO = latexinkscapeicemaker
IMAGE = $(NS)/$(REPO)

.PHONY: build build_ubuntu build_basic build_full

build_ubuntu: Dockerfile.ubuntu
	@docker build -f Dockerfile.ubuntu -t $(IMAGE):ubuntu .

default: build
