# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# OhMyZsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
  bundler
  dotenv
  git
  rails
  ruby
  sublime
)

source $ZSH/oh-my-zsh.sh

# Homebrew
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  arch="$(uname -m)"
  if [[ "$arch" = x86_64* ]]; then
    if [[ "$(uname -a)" = *ARM64* ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      eval "$(/usr/local/Homebrew/bin/brew shellenv)"
    fi
  elif [[ "$arch" = arm64* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Binaries
export PATH="$HOME/.bin:$PATH"

# asdf
source $(brew --prefix asdf)/libexec/asdf.sh

# direnv
eval "$(direnv hook zsh)"

# ip
alias ip="curl -s https://api.melvin.pizza/v1/ip | jq"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# SSH Locale Fix
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# z
source $(brew --prefix z)/etc/profile.d/z.sh
