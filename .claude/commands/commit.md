---
description: Cria commits atômicos no padrão Conventional Commits em português
---

Faça commits das alterações atuais seguindo o CLAUDE.md:

1. Rode `git status` e `git diff`. Se a branch atual for `main` ou `develop`, pare e peça para criar uma branch (`/nova-branch`).
2. Separe as mudanças em commits pequenos, um por assunto lógico, adicionando os arquivos explicitamente (nada de `git add -A` às cegas; confira se não há `.env` ou segredos).
3. Escreva cada mensagem como `<tipo>(<escopo>): <descrição>`, em português, no imperativo, minúsculas, sem ponto final e com até 72 caracteres. Use o corpo só para explicar o porquê.
4. **Nunca** inclua `Co-Authored-By`, `Claude-Session`, "Generated with" nem qualquer menção a IA.
5. Não use `--no-verify` e não altere `user.name` nem `user.email`.
6. Mostre o `git log --oneline` dos commits criados.
