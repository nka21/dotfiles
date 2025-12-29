# ===== プロンプト設定 =====
# 対話的シェル起動時に毎回読み込まれる

precmd() {
    # Gitブランチ名を取得して表示
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$CURRENT_BRANCH" ]; then
        CURRENT_BRANCH_TEXT=" (%F{blue}${CURRENT_BRANCH}%f)"
    else
        unset CURRENT_BRANCH_TEXT
    fi

    # Python仮想環境名を取得して表示
    if [ -n "$VIRTUAL_ENV" ]; then
        VENV_NAME=$(basename "$VIRTUAL_ENV")
        VENV_TEXT="(%F{yellow}${VENV_NAME}%f) "
    else
        VENV_TEXT=""
    fi

    # プロンプト: (venv) user: ~/path (branch)
    PS1="$VENV_TEXT%F{green}%n%f: %F{magenta}%~%f$CURRENT_BRANCH_TEXT"$'\n'"%# "
}

# ===== エイリアス =====

# 標準コマンドをモダンツールに置き換え
alias ls="eza -l --git --icons"
alias ll="eza -la --git --icons"
alias cat="bat"

# 42Tokyo - コンパイラフラグ・Norminette
alias wcc="cc -Wall -Wextra -Werror"
alias wg++="g++ -Wall -Wextra -Werror"
alias norm="norminette -R CheckDefine"
alias francinette=/Users/naoki/francinette/tester.sh
alias paco=/Users/naoki/francinette/tester.sh

# GitHub Actions - バージョン固定ツール
alias pinact='go run github.com/suzuki-shunsuke/pinact/cmd/pinact@latest run'

# ghq + fzf - リポジトリ移動widget起動
alias repo='ghq-fzf-widget'

# ===== 関数 =====

# ghq-fzf-select - ghqリポジトリをfzfで選択（プレビュー付き）
ghq-fzf-select() {
    ghq list | fzf \
        --reverse \
        --ansi \
        --preview-window=right:50%:wrap \
        --preview "eza -la --git --icons --color=always --no-permissions --no-user --no-time --no-filesize $(ghq root)/{}"
}

# ghq-fzf-widget - ghqリポジトリに移動
ghq-fzf-widget() {
    local src
    src=$(ghq-fzf-select) || return
    if [[ -n "$src" ]]; then
        cd "$(ghq root)/$src"
    fi
}

# ghb - ghqリポジトリをブラウザで開く
ghb() {
    local src
    src=$(ghq-fzf-select) || return
    if [[ -n "$src" ]]; then
        gh repo view --web "$src"
    fi
}

# acc - AtCoder CLI拡張（acc sy で確認なし提出）
acc() {
    if [ "$1" = "sy" ]; then
        shift
        acc submit -s -- -y "$@"
    else
        command acc "$@"
    fi
}

# minify_video - 動画圧縮（完了後に元ファイル削除確認）
minify_video() {
    if [ -z "$1" ]; then
        echo "Usage: minify_video <video_file>"
        return 1
    fi

    local file_path=$1
    local file_ext="${file_path##*.}"
    local base_name=$(basename "$file_path" ".$file_ext")
    local dir_path=$(dirname "$file_path")
    local output_file="${dir_path}/${base_name}_minify.mp4"

    echo "Compressing: $file_path"
    echo "Output: $output_file"

    if ffmpeg -i "$file_path" -vcodec libx264 -crf 23 "$output_file"; then
        echo "\nCompression completed!"

        read -q "REPLY?Delete original file? (y/N): "
        echo

        if [[ $REPLY == "y" ]]; then
            rm "$file_path"
            echo "%F{green}✓ Successfully deleted:%f $file_path"
        fi
    else
        echo "Error: Compression failed"
        return 1
    fi
}

# man - マニュアルのカラー表示
man() {
    env GROFF_NO_SGR=1 LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# ===== オプション =====

# ビープ音を無効化
setopt no_beep

# ===== プラグイン =====

# sheldon - zshプラグインマネージャー
eval "$(sheldon source)"
