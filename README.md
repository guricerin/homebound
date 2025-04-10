# homebound

- [home ディレクトリ](./home/)配下のファイルを参照するシムリンクを、`$HOME`に再帰的に作成する
- 意図しないファイルがリポジトリに含まれるのを防止したいので、ディレクトリのシムリンクは作成しない

## Before Setup

### Install depends

```sh
sudo apt install build-essential procps curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- https://github.com/Homebrew/install
- https://docs.brew.sh/Homebrew-on-Linux#requirements

### SSH setting of GitHub

```sh
mkdir -p ~/.ssh/keys/github
ssh-keygen -t ed25519 -f ~/.ssh/keys/github/id_ed25519
cat ~/.ssh/keys/github/id_ed25519.pub
# paste pub-key to GitHub -> Settings -> SSH and GPG keys -> SSH keys
```

### Clone this repo

```sh
cd $HOME
git clone git@github.com:guricerin/homebound.git
```

## Setup

### dry-run

```sh
./path/to/homebound/setup.sh
```

### apply

```sh
./path/to/homebound/setup.sh --apply
```

## After Setup

### Install tools

```sh
./path/to/homebound/scripts/depends.sh
```

### Set fish as default shell

```sh
echo `which fish` | sudo tee -a /etc/shells
chsh -s `which fish`
```

### Reload fish config

```sh
reload
```

see: [reload.fish](home/.config/fish/functions/reload.fish)
