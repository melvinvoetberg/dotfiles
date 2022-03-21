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
eval "$(/opt/homebrew/bin/brew shellenv)"

# Binaries
export PATH="$HOME/.bin:$PATH"

# asdf
source $(brew --prefix asdf)/libexec/asdf.sh

# direnv
eval "$(direnv hook zsh)"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# SSH Locale Fix
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# z
source $(brew --prefix z)/etc/profile.d/z.sh
