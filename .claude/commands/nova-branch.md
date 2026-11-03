---
description: Cria uma branch de trabalho a partir da develop atualizada
argument-hint: <tipo>/<nome-curto>
---

Crie a branch `$ARGUMENTS` seguindo o CLAUDE.md:

1. Confirme que o nome usa um prefixo válido (`feat/`, `fix/`, `chore/`, `docs/`, `refactor/`, `test/`, `style/`, `ci/`), em minúsculas, com hífen e sem acento. Se não usar, proponha o nome correto.
2. Rode `git fetch origin develop` e crie a branch a partir de `origin/develop`.
3. Não faça commit na `main` nem na `develop`.
4. Informe o nome final da branch.
