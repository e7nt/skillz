#!/usr/bin/env bash
# skillz installer — curl -fsSL https://skillz.e7nt.com/install.sh | bash
set -euo pipefail

REPO_URL="${SKILLZ_BASE_URL:-https://skillz.e7nt.com}"
SKILLZ_HOME="${SKILLZ_HOME:-$HOME/.skillz}"

mkdir -p "$SKILLZ_HOME/bin" "$SKILLZ_HOME/skills"

echo "==> fetching skillz CLI"
curl -fsSL "$REPO_URL/skillz" -o "$SKILLZ_HOME/bin/skillz"
chmod +x "$SKILLZ_HOME/bin/skillz"
echo "$REPO_URL" > "$SKILLZ_HOME/base-url"

echo "==> fetching skill catalog"
if curl -fsSL "$REPO_URL/catalog.json" -o "$SKILLZ_HOME/catalog.json" 2>/dev/null; then
  n="$(grep -c '"name"' "$SKILLZ_HOME/catalog.json")"
  echo "    catalog: $n skills available"
else
  echo "    (catalog fetch failed - run 'skillz update' later)"
fi

BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"
ln -sfn "$SKILLZ_HOME/bin/skillz" "$BIN_DIR/skillz"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  case "$SHELL" in
    *zsh)  RC="$HOME/.zshrc" ;;
    *bash) RC="$HOME/.bashrc" ;;
    *)     RC="$HOME/.zshrc" ;;
  esac
  touch "$RC"
  if ! grep -qF "$BIN_DIR" "$RC"; then
    printf '\nexport PATH="%s:$PATH"\n' "$BIN_DIR" >> "$RC"
    echo "==> added $BIN_DIR to PATH in $RC (open a new shell to use 'skillz')"
  fi
fi

"$SKILLZ_HOME/bin/skillz" sync

echo
echo "skillz installed to $SKILLZ_HOME"
echo "try: skillz list   skillz add <name>   skillz update"
