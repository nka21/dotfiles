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

# GitHub - リポジトリをブラウザで開く
alias ghb='gh repo view --web $(ghq list | peco)'

# GitHub Actions - バージョン固定ツール
alias pinact='go run github.com/suzuki-shunsuke/pinact/cmd/pinact@latest run'

# ===== 関数 =====

# g - ghq管理リポジトリに移動（pecoで選択）
g() {
    local selected=$(ghq list | peco)
    if [ -n "$selected" ]; then
        cd "$(ghq root)/$selected"
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
