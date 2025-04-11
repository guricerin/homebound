if not status --is-interactive
  # Ctrl + R などの際に fish は内部的に新たなシェルを起動する
  # その場合はいちいち reload する必要はない
  return 0
end

if string match -q '*-microsoft-standard-WSL2' (uname -r)
  echo "This is wsl2"
  # wsl2 default browser
  set -gx BROWSER "/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
  # linuxbrew
  fish_add_path /home/linuxbrew/.linuxbrew/bin
else if test (uname -s) = "Darwin"
  echo "This is macos"
  # homebrew
  eval (/opt/homebrew/bin/brew shellenv)
end

# PATH を通す際は fish_add_path を使用するのがよい
# my bin
fish_add_path $HOME/bin
# Rust
fish_add_path $HOME/.cargo/bin

# PATH 以外の環境変数は set -gx (--global --export) を使用するのがよい
# config
set -gx XDG_CONFIG_HOME $HOME/.config

# fzf
fzf --fish | source
set -gx FZF_DEFAULT_COMMAND "fd -H -E .git"
## 検索結果はターミナルの下側に表示させる
set -gx FZF_DEFAULT_OPTS "--reverse --height=90%"
## CTRL + T でカレントディレクトリ以下のファイルをプレビュー表示しつつ曖昧検索
set -gx FZF_CTRL_T_COMMAND "fd --type f -H -E .git"
set -gx FZF_CTRL_T_OPTS '--preview "head -100 {}"'
## CTRL + G でリポジトリ移動
bind ctrl-g 'cd (ghq list --full-path | fzf); commandline --function repaint'

# kubectl
kubectl completion fish | source

# helm
helm completion fish | source

# Go
set -gx GOPATH (go env GOPATH)

# abbr: alias と違って、元のコマンドへと展開してくれる
abbr --add l "ls -alF"
abbr --add g "git"
abbr --add f "fzf"
abbr --add k "kubectl"
abbr --add tf "terraform"
abbr --add d "docker"
abbr --add dc "docker compose"

# starship: プロンプト改造
## ↓は最終行に書くこと
starship init fish | source
