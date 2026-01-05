# ===== ログインシェル設定 =====
# ログインシェル起動時のみ読み込まれる
# 環境変数・PATHは .zshenv に記述

# Homebrew
if [[ "$(uname)" == "Darwin" ]] && [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
