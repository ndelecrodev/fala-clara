# API do Fala Clara

Back-end em Python com FastAPI, gerenciado com [uv](https://docs.astral.sh/uv/).

## Requisitos

- Python 3.14 (versão fixada em `.python-version`)
- uv

## Como rodar

```bash
cd api
cp .env.example .env
uv sync
uv run fastapi dev app/main.py
```

A documentação interativa fica em `http://localhost:8000/docs`.

## Qualidade

```bash
uv run ruff check .
uv run ruff format --check .
uv run pytest
```

## Estrutura

- `app/`: código da aplicação (`main.py`, `config.py`)
- `tests/`: testes com pytest
- `migrations/`: migrações do Alembic

A estrutura completa planejada está em [`docs/ESTRUTURA_PASTAS.md`](../docs/ESTRUTURA_PASTAS.md).
