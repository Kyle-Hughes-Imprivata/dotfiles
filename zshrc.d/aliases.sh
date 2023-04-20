#!/usr/bin/env bash
alias bha='history -a'
# shellcheck disable=SC2148
alias docker_prune_all='docker system prune -a'

alias cdh='cd $(find ~ -maxdepth 1 -type d | fzf)'
alias cdp='cd $(find ~/projects -maxdepth 2 -type d | fzf)'
alias cdpp='cd ~/projects'
alias cdd='cd ~/Downloads'

# use vscode in current directory
alias vcc='code -n .'
# open project in vscode using fzf
alias vcp='code -n $(find ~/projects -maxdepth 2 -type d | fzf)'
# aws account aliases
alias aws_whoami='aws sts get-caller-identity'
alias pvdeac='deactivate'
alias kp="keepassxc-cli"
alias kpk="keepassxc-cli -k ~/Documents/keepassxc/keyfile.key"
alias tg="terragrunt"
alias tg_plan_local="terragrunt plan | tee >(sed $'s/\033[[][^A-Za-z]*m//g' > plan.log)"
alias tg_run_all_apply_local="terragrunt run-all apply | tee >(sed $'s/\033[[][^A-Za-z]*m//g' > apply.log)"
alias tf="terraform"
alias kbc="kubectl"
alias cd ="zoxide"
alias ls="exa -al"
alias exa="exa -al"
alias cat=bat
#alias find=fd
alias grep=rg
#alias du=dust
#alias sed=sd
alias cloc=tokei
alias ps=procs
alias cdgitroot="cd $(git rev-parse --show-toplevel)"
alias python="python3"