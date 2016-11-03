GREEN="%{$fg_bold[green]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
RED="%{$fg_bold[red]%}"
RESET="%{$reset_color%}"

NEWLINE='
'
# ICON='⬢'
# ICON='⌘'
ICON='♼'
# PROMPT='$GREEN$ICON $YELLOW%c $(git_prompt_info) $RESET$NEWLINE$CYAN❯$RESET '
PROMPT='$GREEN$ICON $YELLOW%c $(git_prompt_info) $NEWLINE$CYAN❯$RESET '

ZSH_THEME_GIT_PROMPT_PREFIX="<⚡︎> $CYAN"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $RED⦿"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN⦾"
