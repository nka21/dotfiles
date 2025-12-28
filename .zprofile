# ===== 環境変数・PATH設定 =====
# ログインシェル起動時に一度だけ読み込まれる

# Homebrew - macOSパッケージマネージャー
eval "$(/opt/homebrew/bin/brew shellenv)"

# Local bin - ユーザーローカルのバイナリ
export PATH="$HOME/.local/bin:$PATH"

# aqua - CLIツールバージョンマネージャー
export PATH="$HOME/.local/share/aquaproj-aqua/bin:$PATH"
export AQUA_ROOT_DIR="$HOME/.local/share/aquaproj-aqua"
export AQUA_GLOBAL_CONFIG="$HOME/.config/aqua/aqua.yaml"

# mise - 多言語ランタイムマネージャー
eval "$(mise activate zsh)"
