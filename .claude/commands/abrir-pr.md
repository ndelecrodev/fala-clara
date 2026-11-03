---
description: Prepara a descrição de uma PR para a develop usando o template do repositório
---

Prepare a Pull Request da branch atual para a `develop`:

1. Confira que a branch não é `main` nem `develop` e que os commits seguem o padrão do CLAUDE.md.
2. Rode lint e testes das áreas alteradas (`web/` e/ou `api/`) e informe o resultado.
3. Gere título e descrição preenchendo `.github/PULL_REQUEST_TEMPLATE.md` (resumo, tipo, área, issue, como testar, checklist).
4. O título segue o padrão dos commits (`feat(api): adiciona rota /format`).
5. **Nunca** inclua atribuição ou links de IA no título ou na descrição.
6. Só crie a PR de fato se eu pedir; caso contrário, mostre o texto para eu revisar.
