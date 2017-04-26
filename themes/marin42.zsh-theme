# marin42.zsh-theme

local ret_status="%(?:%{$fg_bold[magenta]%}❯%{$reset_color%} :%{$fg_bold[red]%}❯%{$reset_color%} )"

# primary prompt
PROMPT='%{$fg_bold[blue]%}%~ $(git_prompt_info)% %{$reset_color%}${ret_status}'


# color vars
eval my_gray='$FG[237]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)%{$fg_bold[grey]%}%T%{$reset_color%}%'
else
	RPROMPT='$my_gray%T%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[cyan]%})%{$reset_color%} "

