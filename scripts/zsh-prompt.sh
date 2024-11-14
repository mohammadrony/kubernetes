#!/bin/bash
# Download prompt plugin
git clone https://github.com/superbrothers/zsh-kubectl-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-kubectl-prompt

# Add kubectl prompt plugin
sed -i '/^plugins/s/)/ zsh-kubectl-prompt)/' ~/.zshrc

# Save in ~/.zshrc or ~/.zsh_functions
kinfo() {
    if [ -z "$RPROMPT" ]; then
        RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
    else
        RPROMPT=''
    fi
}
