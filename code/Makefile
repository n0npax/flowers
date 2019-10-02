lint: lint-black lint-sec

lint-black:
	black --check .

lint-sec:
	bandit .

docker:
	docker build . -t demo-project

test:
	python3 -m pytest .

all: resolve-version
	$(MAKE) test
	$(MAKE) docker	
