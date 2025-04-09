
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
