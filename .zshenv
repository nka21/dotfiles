# ===== 環境変数・PATH設定 =====
# すべてのzsh起動時に読み込まれる

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# aqua
export PATH="$HOME/.local/share/aquaproj-aqua/bin:$PATH"
export AQUA_ROOT_DIR="$HOME/.local/share/aquaproj-aqua"
export AQUA_GLOBAL_CONFIG="$HOME/.config/aqua/aqua.yaml"

# mise
eval "$(mise activate zsh)"
