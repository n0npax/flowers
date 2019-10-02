.PHONY: lint
lint: lint-black lint-sec

.PHONY: lint-black
lint-black:
	python3 -m black --check -q .

.PHONY: lint-sec
lint-sec:
	python3 -m bandit -r -c .bandit.yaml -q .

.PHONY: build
build:
	echo TODO

.PHONY: test
test:
	python3 -m pytest .

.PHONY: all
all: lint
	$(MAKE) test
	$(MAKE) build
