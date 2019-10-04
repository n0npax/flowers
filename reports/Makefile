.PHONY:
deps:
	python3 -m pip install -r requirements.txt

.PHONY: lint
lint: lint-sec lint-black

.PHONY: lint-black
lint-black: deps
	python3 -m black --check -q .

.PHONY: lint-sec
lint-sec: deps
	python3 -m bandit -r -c .bandit.yaml -q .

.PHONY: build
build: deps
	echo TODO

.PHONY: test
test: deps
	python3 -m pytest --cov-report=xml --cov . .

.PHONY: codecov
codecov: test coverage.xml
	codecov --file coverage.xml --root .. --commit $(COMMIT_SHA) -t $(CODECOV_TOKEN)
	cp coverage.xml coverage-$(COMMIT_SHA).xml

.PHONY: all
all: lint
	$(MAKE) test
	$(MAKE) build
