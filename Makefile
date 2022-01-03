.PHONY: venv
venv:
	./scripts/create_virtualenv.sh

.PHONY: pip-compile
pip-compile:
	for env in "" ; do \
		echo "=> Generating requirements$$env.txt ..." ; \
		pip-compile --quiet \
			--allow-unsafe \
			--generate-hashes \
			--output-file=requirements/requirements$$env.txt \
			requirements/requirements$$env.in; \
	done

.PHONY: pip-install
pip-install:
	pip install -r requirements/requirements.txt

.PHONY: pip-outdated
pip-outdated:
	pip list --outdated

.PHONY: mkdocs-serve
mkdocs-serve:
	mkdocs serve

.PHONY: mkdocs-dirtyreload
mkdocs-dirtyreload:
	mkdocs dirtyreload

.PHON: mkdocs-build
mkdocs-build:
	mkdocs build

.PHONY: lint-vale
lint-vale:
	./scripts/vale.sh

.PHONY: lint-markdownlint
lint-markdownlint:
	./scripts/markdownlint.sh

.PHONY: lint
lint:
	$(MAKE) lint-vale
	$(MAKE) lint-markdownlint
