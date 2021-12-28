# dicehub-docs

Public documentation for dicehub.

## Development

This documentation uses `mkdocs`. To contribute to the documentation python 3 is
required and the following steps have to be followed to setup the development
environment:

1. Create virtual environment:

```sh
make venv
```

2. Activate virtual environment:

```sh
source .venv/bin/activate
```

3. Install python requirements:

```sh
make pip-install
```

4. Start mkdocs server:

```sh
mkdocs serve
```

Now open `http://localhost:8000` and the rendered documentation should be visible.
