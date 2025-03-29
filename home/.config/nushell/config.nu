# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

alias l = ls -al
alias g = git
alias f = fzf

alias d = docker
alias dc = docker compose

alias k = kubectl

alias tf = terraform

$env.config = {
  keybindings: [
    {
      name: cd_fuzzy_ghq
      modifier: control
      keycode: char_g
      mode: emacs
      event: {
        send: executehostcommand,
        cmd: "cd (ghq list --full-path | fzf | decode utf-8 | str trim)"
      }
    }
  ]
}

# starship: プロンプト改造
## ↓は最終行に書くこと
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
