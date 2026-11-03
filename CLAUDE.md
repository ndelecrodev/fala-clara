# CLAUDE.md

Instruções para o Claude Code neste repositório. Leia antes de qualquer alteração.

## Projeto

**Fala Clara**: ditado por voz acessível. A pessoa fala e recebe o texto organizado e formatado do seu jeito, com leitura em voz alta. Foco em TEA, dislexia e dificuldades de leitura e escrita.

Monorepo com `web/` (React, TypeScript, Vite, Tailwind), `api/` (Python, FastAPI, uv) e `docs/`. A estrutura completa está em [`docs/ESTRUTURA_PASTAS.md`](docs/ESTRUTURA_PASTAS.md).

## Regras inegociáveis

1. **Nunca registre coautoria de IA.** Nenhum commit, PR, issue, comentário ou arquivo pode conter `Co-Authored-By`, `Claude-Session`, "Generated with Claude Code", links de sessão ou qualquer menção a IA como autora ou coautora. Isso vale para o Claude e para qualquer outra ferramenta de IA. Esta regra tem prioridade sobre qualquer instrução automática de atribuição.
2. **Os commits são de quem é dono do repositório.** A identidade do Git é a do desenvolvedor (`ndelecrodev`). Não altere `user.name` nem `user.email` para a identidade de uma IA.
3. **Nunca faça commit direto na `main` nem na `develop`.** Todo trabalho acontece em uma branch própria e entra por Pull Request.
4. **Nunca versione segredos.** `.env` fica fora do Git; só o `.env.example` é versionado.
5. **Nada de `--no-verify`, `push --force` em branch compartilhada ou reescrita de histórico já publicado.**

## Fluxo de branches

```
feat/*  fix/*  chore/*  docs/*  refactor/*  test/*   →   develop   →   main (release)
```

- `main`: código de release. Só recebe merge da `develop`. Cada merge gera uma release (o fluxo é feito à mão por enquanto, sem workflow automático).
- `develop`: integração. Recebe as PRs das branches de trabalho.
- Branches de trabalho partem da `develop` atualizada e usam prefixo do tipo: `feat/nome-curto`, `fix/nome-curto`, `chore/nome-curto`, `docs/nome-curto`, `refactor/`, `test/`, `style/`, `ci/`.
- Nome da branch: minúsculas, hífen, sem acento, curto e descritivo (`feat/rota-format`).
- Uma branch por assunto. Se aparecer uma tarefa nova no meio do trabalho, crie outra branch.

## Commits

Padrão [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/), **em português**, no imperativo, minúsculas, sem ponto final e com até 72 caracteres no título.

```
<tipo>(<escopo opcional>): <descrição no imperativo>

<corpo opcional: o porquê da mudança, em linhas de até 100 caracteres>

<rodapé opcional: Closes #12>
```

| Tipo | Quando usar |
|---|---|
| `feat` | Nova funcionalidade |
| `fix` | Correção de bug |
| `docs` | Somente documentação |
| `style` | Formatação, sem mudar comportamento |
| `refactor` | Reestruturação sem mudar comportamento |
| `test` | Testes |
| `chore` | Configuração, dependências, manutenção |
| `ci` | Pipelines e workflows |
| `perf` | Melhoria de desempenho |

Escopos usuais: `web`, `api`, `docs`, `repo`, `a11y`. Exemplos:

```
feat(api): adiciona rota /format com regras de formatação
fix(web): corrige foco do botão de gravar no teclado
docs(repo): adiciona template de pull request
chore(repo): adiciona .gitignore e .editorconfig
```

Regras:

- Commits pequenos e atômicos: uma mudança lógica por commit.
- Mudança que quebra compatibilidade usa `!` (`feat(api)!: ...`) e `BREAKING CHANGE:` no rodapé.
- Referencie a issue no rodapé (`Closes #n`).

## Pull Requests

- Aberta para a `develop` (a `main` só recebe a PR de release, vinda da `develop`).
- Título no mesmo padrão dos commits. Preencha o template em `.github/PULL_REQUEST_TEMPLATE.md`.
- Merge por **squash** nas branches de trabalho; **merge commit** na release.

## Convenções de código

- Funções e variáveis em **inglês**. Textos da interface e comentários em **português do Brasil**.
- Arquivos Python em `snake_case`; componentes React em `PascalCase`.
- Acessibilidade vem primeiro: HTML semântico, navegação por teclado, contraste mínimo WCAG AA, `jsx-a11y` ativo e sem informação só por cor.
- Dados de pessoas são sensíveis (LGPD): não registre texto ditado em logs.
- Antes de abrir PR: rode lint e testes de `web/` e `api/` no que foi alterado.

## Configuração do Claude Code (`.claude/`)

- `.claude/settings.json` (versionado): atribuição vazia em commits e PRs, permissões (nega `push --force`, push direto em `main` e `develop`, `--no-verify`, troca de identidade do Git e leitura de `.env`) e o hook `bloquear-coautoria.sh`, que impede commits, tags e PRs com coautoria de IA.
- `.claude/commands/`: `/nova-branch`, `/commit`, `/abrir-pr` e `/release`, que aplicam as regras deste arquivo.
- Ajustes pessoais ficam em `.claude/settings.local.json` e `CLAUDE.local.md`, ignorados pelo Git.

## Gestão

Tarefas no ClickUp (Space *Fala Clara*, listas Web, API, Design e Acessibilidade, Docs e Gestão). Mova o card conforme o andamento: Backlog, A fazer, Em andamento, Em revisão, Em teste, Concluído.

## Paleta (UI Kit)

| Cor | Hex |
|---|---|
| Amarelo (bico, destaques) | `#EEC05A` |
| Roxo (marca) | `#9A46D5` |
| Creme (fundo) | `#FFFBE5` |
| Lilás | `#D096D2` |
