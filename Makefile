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
