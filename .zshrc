#################################################################################################################################################
############################################################## Shell Configuration ##############################################################
#################################################################################################################################################

#zsh options and history
# Report command running time if it is more than 3 seconds
REPORTTIME=3
# Keep a lot of history
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
# Also remember command start time and duration
setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Correct spelling of all arguments in the command line
setopt CORRECT_ALL
# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate 
#fix moving between words
bindkey ";5C" forward-word
bindkey ";5D" backward-word


# Use Starship
eval "$(starship init zsh)"

# ZSH AutoSuggestions
cd ~/.zsh/zsh-autosuggestions && git pull && cd -
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

##########################################################################################################################################################
############################################################## Commands to initialize tools ##############################################################
##########################################################################################################################################################
# Path modifications
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:$HOME/.tgenv/bin"
export PATH="$PATH:$HOME/.tfenv/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.pulumi/bin"
export PATH="$PATH:$HOME/.nvm/bin"
export PATH="$PATH:/usr/local/bin/jenv/jenv-0.5.5/bin"
export PATH="$PATH:$HOME/.pulumi/bin"

# Jenv
eval "$(jenv init -)"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"

# Kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# TGenv
export TGENV_AUTO_INSTALL=true

# Snowflake
export SNOWSQL_USER="KYLEHUGHES"

# for Bastionzero installs
# export REGISTRATION_SECRET=$(secret-tool lookup app bastionzero)

export AWS_PROFILE=default
export AWS_REGION=us-east-2

# ArgoCD
export ARGOCD_SERVER="argocd.ci.imprivata.cloud"
export ARGOCD_SERVER="argocd.ci.imprivata.cloud"
export ARGOCD_SERVER="argocd.ci.imprivata.cloud"

# OCI
#[[ -e "/home/kyle/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/kyle/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh"


################################################################################################################################################
############################################################## User Configuration ##############################################################
################################################################################################################################################
# Aliases
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




#######################################################################################################################################
############################################################## Functions ##############################################################
#######################################################################################################################################
function get_secrets() {
  echo "Grabbing from KeePassXC"
  export GITHUB_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx GITHUB_TOKEN)
  export ARGOCD_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx CI_ARGOCD_TOKEN)
  # export ARGOCD_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx PROD1_ARGOCD_TOKEN)
  # export ARGOCD_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx PROD2_ARGOCD_TOKEN)
  
  # export ASTRA_PACKAGES_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx ASTRA_PACKAGES_TOKEN)
  # export PERSONAL_GITHUB_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx PERSONAL_GITHUB_TOKEN)
  # export OPENAI_API_KEY=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx OPENAI_API_KEY)
  # export SNYK_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SNYK_TOKEN)
  # export SNYK_INTEGRATION_ID=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SNYK_INTEGRATION_ID)
  # export SNYK_ORG_ID=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SNYK_ORG_ID)
  # export SNYK_IAM_API_KEYS=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SNYK_IAM_API_KEYS)
  # export SLACKBOT_USER_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SLACKBOT_USER_TOKEN)
  # export SLACKBOT_BOT_TOKEN=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SLACKBOT_BOT_TOKEN)
  # export SLACKBOT_WEBHOOK=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SLACKBOT_WEBHOOK)
  # export ASTRA_DEV_SNOWSQL_ACCOUNT=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx ASTRA_DEV_SNOWSQL_ACCOUNT)
  # export ASTRA_DEV_SNOWSQL_PASS=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx ASTRA_DEV_SNOWSQL_PASS)
  # export SNYK_ORG_ID=$(keepassxc-cli show -a Password  --no-password -k ~/Documents/keepassxc/keyfile.key ~/Documents/keepassxc/Passwords.kdbx SNYK_ORG_ID)
}

# Secrets
if [[ $GITHUB_TOKEN == "" ]];then
  get_secrets
fi

function ekslogin() {
  if [[ -n $1 ]]; then
    echo "logging into specified cluster: $1"
    aws eks --region $AWS_REGION update-kubeconfig --name $1 --profile $AWS_PROFILE
  else
    echo "cluster list:"
    aws eks list-clusters | jq
  fi
}

function weather() {
  curl https://wttr.in/Boston\?u
}


function aws_cli_update() {
  mkdir aws_tmp && cd aws_tmp
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
  cd -
  rm -rf aws_tmp
}

function aws_pass_gen() {
  aws secretsmanager get-random-password --exclude-punctuation --region ${AWS_REGION} | jq -r .RandomPassword
}

function local_ref_state() {
  if [[ $1 == "" ]];then
    echo "git branch name required"
    return
  fi
  cd ~/Documents/github/imprivata-cloud
  rm -rf local-ref-state
  git clone git@github.com:imprivata-cloud/astra-reference-infrastructure.git local-ref-state
  cd local-ref-state
  git checkout $1
  if [[ $? != 0 ]]; then
    echo "invalid git branch name"
    return
  fi
  aws sts get-caller-identity >/dev/null
  if [[ $? != 0 ]]; then
    echo "run aws sso login and try again"
    return
  fi
  bash get-branch-state-locally.sh
  lapce .
}

function zoom_install() {
  cd
  sudo apt remove zoom
  mkdir zoomtmp
  cd zoomtmp
  wget https://zoom.us/client/latest/zoom_amd64.deb
  ls
  sudo apt install ./zoom_amd64.deb
  cd ..
  rm -rf zoomtmp
}

function lapce_install() {
  cd
  install_location="/usr/local/bin/lapce"
  echo "install location: $install_location"
  sudo rm $install_location
  rm -rf lapcetmp
  mkdir lapcetmp
  cd lapcetmp
  wget https://github.com/lapce/lapce/releases/download/v0.2.7/Lapce-linux.tar.gz
  #nightly
  ls
  tar -xzf ./Lapce-linux.tar.gz
  ls
  cd Lapce
  chmod 777 lapce
  sudo mv lapce $install_location
  which lapce
  cd
  rm -rf lapcetmp
}

function bw_install() {
  cd
  bin="bw"
  version="2023.3.0"
  install_location="/usr/local/bin/bw"
  tmpdir="bwtmp"
  link="https://github.com/bitwarden/clients/releases/download/cli-v$version/$bin-linux-$version.zip"
  echo "install location: $install_location"
  sudo rm $install_location
  rm -rf $tmpdir
  mkdir $tmpdir
  cd $tmpdir
  wget "$link"
  ls
  unzip .$bin-linux-$version.zip
  ls
  cd $bin-linux-$version
  chmod 700 $bin
  sudo mv $bin $install_location
  which $bin
  cd
  rm -rf $tmpdir
}

function delete_state() {
  # delete the old state and remove the folder
  # this takes an hour to run
  cd $1
  terragrunt state list > state.txt
  sed --in-place '1d' state.txt
  sed --in-place '1d' state.txt
  params=$(tr '\n' ' ' < state.txt)
  echo "params $params"
 
  if [[ "${params}" != "" ]]; then
    pwd
    terragrunt state rm $params
  else
    echo "Skipping no state"
  fi
  rm -rf .terragrunt-cache/
  cd -
}

function keyget() {
  #awk -v ORS='\\n' '1' $1 | sed -z "s/\n//g"
  awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' $1
}

function keycopy() {
  awk -v ORS='\\n' '1' $1 | sed -z "s/\n//g" | xclip -selection clipboard
}

function node_cleanup() {
  cd /home/kyle/Documents
  find . -name "node_modules" -type d -prune -print | xargs du -chs
  find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;
  cd -
}



