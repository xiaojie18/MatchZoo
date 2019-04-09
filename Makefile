init:
	pip install -r requirements.txt

MATCHZOO_TEST_ARGS = -v --doctest-modules --doctest-continue-on-failure --cov matchzoo/ --cov-report term-missing --cov-report html --cov-config .coveragerc matchzoo/ tests/ -W ignore::DeprecationWarning --continue-on-collection-errors
MATCHZOO_FLAKE_ARGS = ./matchzoo --exclude=__init__.py,matchzoo/contrib

test:
	pytest $(MATCHZOO_TEST_ARGS)
	flake8 $(MATCHZOO_FLAKE_ARGS)

quick:
	pytest -m 'not slow' $(MATCHZOO_TEST_ARGS)

slow:
	pytest -m 'slow' $(MATCHZOO_TEST_ARGS)

flake:
	flake8 $(MATCHZOO_FLAKE_ARGS)
