# Use this command if you want your terminal commands be saved 
# in your history file in real time instead of waiting until the 
# terminal is closed
shopt -s histappend ; 
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

