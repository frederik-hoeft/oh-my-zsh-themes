'/c/Windows/system32/net.exe' session &> /dev/null
is_elevated=$?

NEW_LINE=$'\n'

if [ $is_elevated -eq 0 ]; then
    PROMPT="%{$fg[white]%}┌─○ %{$fg_bold[red]%}%n%{$reset_color%}@%M in %{$fg_bold[cyan]%}%d%{$reset_color%}"
else
    PROMPT="%{$fg[white]%}┌─○ %{$fg_bold[green]%}%n%{$reset_color%}@%M in %{$fg_bold[cyan]%}%d%{$reset_color%}"
fi

PROMPT+=' $(git_prompt_info)'
PROMPT+="${NEW_LINE}%{$reset_color%}└──%(?:%{$fg_bold[cyan]%}> :%{$fg_bold[red]%}> )%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
