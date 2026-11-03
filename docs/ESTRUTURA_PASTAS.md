# Estrutura de pastas: FalaClara

Monorepo `fala-clara` com duas aplicações independentes (`web/` e `api/`) e uma pasta de documentação.

## Visão geral

```
fala-clara/
├── web/                         # Front-end (React + TypeScript + Vite + Tailwind)
├── api/                         # Back-end (Python + FastAPI, gerenciado com uv)
├── docs/                        # Documentação do projeto
├── .github/
│   └── workflows/               # CI (lint e testes do web e da api)
├── .gitignore
├── LICENSE
└── README.md
```

## Front-end (`web/`)

```
web/
├── public/
│   └── fonts/                   # OpenDyslexic, Atkinson Hyperlegible
├── src/
│   ├── main.tsx                 # ponto de entrada
│   ├── App.tsx                  # rotas
│   ├── components/
│   │   ├── Recorder/            # botão de gravar, indicador de escuta
│   │   ├── Editor/              # exibição e edição do texto formatado
│   │   ├── Reader/              # leitura em voz alta, destaque da palavra
│   │   ├── PreferenceForm/      # perguntas de preferência do cadastro
│   │   └── ui/                  # botões, campos, modais acessíveis
│   ├── pages/
│   │   ├── Onboarding.tsx       # cadastro + preferências
│   │   ├── Login.tsx
│   │   ├── EditorPage.tsx       # tela principal de ditado
│   │   └── Notes.tsx            # textos salvos
│   ├── lib/
│   │   ├── speech/
│   │   │   ├── recognition.ts   # reconhecimento de voz (interface trocável)
│   │   │   └── synthesis.ts     # leitura em voz alta
│   │   ├── api.ts               # cliente da API
│   │   ├── auth.ts              # token e sessão
│   │   └── preferences.ts       # aplicar fonte, caixa, tema, espaçamento
│   ├── hooks/                   # useRecognition, useReader, usePreferences
│   ├── types/                   # tipos TypeScript (gerados da API quando possível)
│   └── styles/
│       └── index.css            # Tailwind e variáveis de tema
├── tests/                       # Vitest e testes de acessibilidade
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
├── eslint.config.js             # inclui jsx-a11y
└── .env.example
```

## Back-end (`api/`)

```
api/
├── app/
│   ├── main.py                  # cria o app FastAPI, CORS, rotas
│   ├── config.py                # pydantic-settings, lê o .env
│   ├── db.py                    # engine e sessão do SQLAlchemy
│   ├── models.py                # User, Preferences, Note
│   ├── schemas.py               # modelos Pydantic de entrada e saída
│   ├── security.py              # hash Argon2 e JWT
│   ├── deps.py                  # get_db, get_current_user
│   ├── routers/
│   │   ├── auth.py              # /auth/register, /auth/login
│   │   ├── preferences.py       # /preferences
│   │   ├── notes.py             # /notes
│   │   ├── format.py            # /format
│   │   ├── transcribe.py        # /transcribe (fase 2)
│   │   └── account.py           # DELETE /account (LGPD)
│   └── services/
│       ├── rules.py             # classificação e formatação por regras
│       ├── llm.py               # fallback com IA + cache + limite diário
│       ├── stt.py               # faster-whisper (fase 2)
│       └── tts.py               # Piper (opcional)
├── migrations/                  # Alembic
│   ├── env.py
│   └── versions/
├── tests/
│   ├── test_rules.py            # regras de formatação (o mais importante)
│   ├── test_auth.py
│   ├── test_format.py
│   └── conftest.py
├── pyproject.toml               # dependências (uv)
├── uv.lock                      # versionar
├── .python-version              # versionar
├── alembic.ini
└── .env.example
```

## Documentação (`docs/`)

```
docs/
├── ARCHITECTURE.md              # arquitetura e decisões técnicas
├── ROADMAP.md                   # fases do projeto
├── ESTRUTURA_PASTAS.md          # este arquivo
├── API.md                       # contrato dos endpoints (resumo do /docs do FastAPI)
├── ACESSIBILIDADE.md            # checklist WCAG e resultados de testes
└── PRIVACIDADE.md               # tratamento de dados, LGPD, retenção
```

## O que NÃO versionar (`.gitignore`)

```
# Python
api/.venv/
__pycache__/
*.pyc
.pytest_cache/
.ruff_cache/

# Node
web/node_modules/
web/dist/

# Segredos e dados locais
.env
*.db
*.sqlite3

# Editor e sistema
.vscode/
.idea/
.DS_Store
```

Versionar sempre: `pyproject.toml`, `uv.lock`, `.python-version`, `package.json`, `package-lock.json` e os arquivos `.env.example`.

## Convenções

- **Pastas e arquivos Python:** `snake_case`.
- **Componentes React:** `PascalCase` (uma pasta por componente quando tiver estilo ou teste próprio).
- **Funções e variáveis:** em inglês. Textos da interface e comentários: português do Brasil.
- **Branches:** `feat/nome-curto`, `fix/nome-curto`, `docs/nome-curto`.
- **Commits:** curtos e no imperativo (`feat: adiciona rota /format`).

## Estrutura no ClickUp (Space Fala Clara)

```
Fala Clara
├── Web (Front-end)              → trabalho em web/
├── API (Back-end)               → trabalho em api/
├── Design e Acessibilidade      → protótipos, WCAG, testes com usuários
└── Docs e Gestão                → docs/, privacidade, deploy, organização
```

Colunas do kanban: Backlog, A fazer, Em andamento, Em revisão, Em teste, Concluído e Cancelado (a lista Docs e Gestão não tem "Em teste").
