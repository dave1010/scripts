
alias .='pwd'
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

alias httpserver='ip && python -m SimpleHTTPServer' # serve current directory on port 8000

alias 'ip=/sbin/ifconfig|grep "inet addr"|awk "{print \$2}"|sed s/addr://g' # get all local ip addresses

alias nmap24='nmap -sP `ip`/24|grep report|awk " { print \$5 } "' # see what hosts respond to pings on your /24 network

alias xc="xclip -selection clipboard"

goo () { w3m http://gog.is/"$*"; }

