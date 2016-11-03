# Use spectrum_ls + http://paletton.com/
local green="%{$fg_bold[green]%}"
local yellow="%{$fg_bold[yellow]%}"
local cyan="%{$FG[122]%}"
local red="%{$fg_bold[red]%}"
local grey='\e[0;90m'
local reset="%{$reset_color%}"
local mag="%{$FG[199]%}"
local newline='
'
local icon='⌘'
local arrow='⇢'
PROMPT='${mag}${icon} ${cyan}%~ $(git_prompt_info) ${newline}${mag}${arrow}${reset} '

ZSH_THEME_GIT_PROMPT_PREFIX="${grey}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${red}⦿"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${green}⦾${reset}"
