.PHONY: clear
clear:
	find -type f -name "*.pyc" -delete

.PHONY: lint
lint: lint-black lint-sec

.PHONY: lint-black
lint-black:
	black --check -q .

.PHONY: lint-sec
lint-sec:
	bandit -r -c .bandit.yaml -q .

.PHONY: docker
docker:
	docker build . -t demo-project

.PHONY: test
test:
	python3 -m pytest .

.PHONY: all
all: clear
	$(MAKE) lint
	$(MAKE) test
	$(MAKE) docker	