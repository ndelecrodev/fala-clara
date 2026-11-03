#!/usr/bin/env bash
# Bloqueia commits e PRs que citem IA como autora ou coautora (regra do CLAUDE.md).
# Lê o JSON do hook na entrada padrão; código de saída 2 impede a execução do comando.
set -euo pipefail

comando="$(jq -r '.tool_input.command // ""')"

if [[ "$comando" =~ (git[[:space:]]+commit|gh[[:space:]]+pr|git[[:space:]]+tag) ]] &&
  printf '%s' "$comando" | grep -Eiq 'co-authored-by|claude-session|generated with|noreply@anthropic\.com|claude\.ai/code'; then
  echo "Bloqueado: não registre coautoria de IA em commits, tags ou PRs (veja CLAUDE.md)." >&2
  exit 2
fi
