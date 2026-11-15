#!/bin/bash
# Réinstalle les outils de l'utilisateur à chaque nouvelle session cloud.
# Chaque étape est indépendante, idempotente, et n'empêche jamais la session de démarrer.
set -uo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

export PATH="$HOME/.local/bin:$PATH"

# Dossier des skills utilisateur : doit exister avant Agent Reach, qui n'y crée son lien que s'il est présent
mkdir -p "$HOME/.claude/skills"

# --- 1. Agent Reach (lecture de plateformes : YouTube, GitHub, web...) ---
# Source officielle : https://github.com/Panniantong/Agent-Reach (ne jamais installer le paquet PyPI homonyme)
if ! command -v agent-reach >/dev/null 2>&1; then
  if command -v uv >/dev/null 2>&1; then
    uv tool install https://github.com/Panniantong/Agent-Reach/releases/latest/download/agent-reach.zip \
      && agent-reach setup >/dev/null \
      || echo "[session-start] Agent Reach : installation échouée (ignorée)" >&2
  else
    echo "[session-start] uv absent : Agent Reach non installé" >&2
  fi
fi

# --- 2. Skill anatomy (figures isométriques animées), fixé au commit audité ---
ANATOMY_SHA="1482e8469b0a9e0d8cc18ea2740a01423d29ae80"
ANATOMY_DIR="$HOME/.claude/skills/anatomy"
if [ ! -f "$ANATOMY_DIR/SKILL.md" ]; then
  tmp="$(mktemp -d)"
  if git clone --quiet https://github.com/wheresryan22/anatomy.git "$tmp/anatomy" \
     && git -C "$tmp/anatomy" checkout --quiet "$ANATOMY_SHA"; then
    mkdir -p "$HOME/.claude/skills"
    rm -rf "$tmp/anatomy/.git"
    rm -rf "$ANATOMY_DIR"
    mv "$tmp/anatomy" "$ANATOMY_DIR"
  else
    echo "[session-start] anatomy : installation échouée (ignorée)" >&2
  fi
  rm -rf "$tmp"
fi

# --- 3. Serveur MCP Context7 (la clé d'API est ajoutée par le proxy de l'environnement) ---
if command -v claude >/dev/null 2>&1; then
  if ! claude mcp get context7 >/dev/null 2>&1; then
    claude mcp add --transport http --scope user context7 https://mcp.context7.com/mcp >/dev/null 2>&1 \
      || echo "[session-start] Context7 : ajout échoué (ignoré)" >&2
  fi
fi

exit 0
