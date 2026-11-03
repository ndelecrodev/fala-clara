---
description: Roteiro manual de release (develop para main) para conferência
argument-hint: <versão, ex.: 0.1.0>
---

Guie a release `v$ARGUMENTS` **sem automação**, passo a passo, para eu executar à mão:

1. Conferir que a `develop` está verde (lint e testes) e sem PRs pendentes.
2. Abrir a PR `develop` → `main` com o resumo das mudanças desde a última tag.
3. Após o merge (merge commit), criar a tag SemVer `v$ARGUMENTS` na `main`.
4. Criar a release no GitHub com as notas agrupadas por tipo (`feat`, `fix`, `docs`...).
5. Listar o que mudou usando `git log <última-tag>..develop --oneline`.

Apenas explique e prepare os textos e comandos; não execute merge, tag nem publicação sem minha confirmação.
