# alias .='pwd' # this can break some systems
alias ..='cd ..'

alias g='git' # as i use git so much

alias xclip='xclip -selection c' # copy stdin to x clipboard

alias nano='nano -c' # show line numbers

alias f='find . -name' # quick find

alias phplint="find . -name '*.php' -exec php -l {} \; | grep -v 'No syntax errors detected'" # lint all php files in dir

# search wikipedia
function wiki () {
COLUMNS=`tput cols`
dig +short txt "${*}".wp.dg.cx | sed -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/' | fmt -w $COLU$
}

alias ack='ack-grep' # http://betterthangrep.com/

alias hl='ack --passthru' # highlight

alias myip='/sbin/ifconfig | grep "inet addr" | awk "{print \$2}" | sed s/addr://g | grep -v 127\.0\.0\.1' # get all local ip addresses

# serve current directory on port 8000
alias httpserver='myip && python -m SimpleHTTPServer' 

# see what hosts respond to pings on your /24 network
alias nmap24='nmap -sP `myip`/24 | grep report | awk " { print \$5 } "' 

# make a ssh tunnel from port 2222 on remote host to 22 on your machine
# usage: ssh-tunnel <user@host>
alias ssh-tunnel='ssh -f -N -C -R 2222:127.0.0.1:22'

# quick ref
# sed -i "s/find/replace/g" filename.txt
# find -name '*.txt' -exec sed -i "s/find/replace/g" {} \; -print

