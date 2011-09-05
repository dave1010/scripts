#### SHORTCUTS ####

#editors
alias n='nautilus `pwd` &' # open the working dir in nautilus
alias e='emacs -nw'
alias v='vim -c start'
alias s='/home/base/bin/sublimetext2/sublime_text'
alias nano='nano -c' # show line numbers

# searching files
alias f='find | grep' # quick find
alias ack='ack-grep' # http://betterthangrep.com/
alias hl='ack --passthru' # highlight

#misc
alias g='git' # as i use git so much
alias xc='xclip -selection c' # copy stdin to x clipboard
alias eb='$EDITOR ~/.bashrc'
alias sb='source ~/.bashrc'

#development
alias phplint="php -l"
alias phplintall="find . -name '*.php' -exec php -l {} \; | grep -v 'No syntax errors detected'"
alias jshint='rhino /home/base/projects/jshint/env/rhino.js'
alias jshintall="find -name '*.js' -exec rhino /home/base/projects/jshint/env/rhino.js {} \;"
alias tailphperror="tail -n 20 -f /var/log/apache2/error.log | sed 's/\\n/\n/g'"
alias phpunitslow='phpunit --no-configuration --group slow --verbose tests'
alias shortphptags="ack --php '\<\?[^px]'" # find short PHP open tags

#### NETWORK ####

alias myip='/sbin/ifconfig | grep "inet addr" | awk "{print \$2}" | sed s/addr://g | grep -v 127\.0\.0\.1' # get all local ip addresses

alias mydns='wget -qO - http://ifconfig.me/all|grep remote_host|awk "{print \$2 }"'

# serve current directory on port 8000
alias httpserver='myip && python -m SimpleHTTPServer' 

# see what hosts respond to pings on your /24 network
alias nmap24='nmap -sP `myip`/24 | grep report | awk " { print \$5 } "' 

# make a ssh tunnel from port 2222 on remote host to 22 on your machine
# usage: ssh-tunnel <user@host>
alias ssh-tunnel='ssh -f -N -C -R 2222:127.0.0.1:22'



#### FUNCTIONS ####

# search wikipedia
function wiki () {
  dig +short txt "${*}".wp.dg.cx | sed -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/'
}

function quickref() {
  echo sed -i "s/find/replace/g" filename.txt
  echo find -name '*.txt' -exec sed -i "s/find/replace/g" {} \; -print
}

function mysqlref() {
  echo 'SELECT ... FROM ... WHERE ... ORDER BY ... DESC LIMIT ...'
  echo 
  echo 'INSERT INTO table1 (id, field2) VALUES (1, value2)'
  echo 'INSERT INTO table1 (id, field2) VALUES (1, value2), (2, value2b)'
  echo 'INSERT INTO table1 SET field1=value_1, field2=value_2'
  echo 'UPDATE table1 SET field1=new_value1 WHERE condition'
  echo 'DELETE FROM table1 WHERE condition'
  echo
  echo 'SHOW DATABASES; SHOW TABLES;'
  echo 'DESCRIBE table; SHOW CREATE TABLE table'
  echo 'SHOW PROCESSLIST; KILL process_number'
  echo
  echo 'CREATE TABLE table (id INT(11), title VARCHAR(255), PRIMARY KEY (id))'
  echo 'update wp_options set option_value ="http://example.com"  where option_name like "home" or option_name like "siteurl"'
}

#google search
goo () { w3m http://gog.is/"$*"; }

# google text to speech
say(){ mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; }



# go up a number of directories
# usage: cdup == "cd .."; cdup 5 == "cd .." x 5
# from picklepete
cdup() {
  levels=${1-1}
  while ((levels--)); do
        cd ..
  done
}

alias ..='cdup' # go up x dirs

# echo some of the output from the last command
# 1st parameter is the line number
# 2nd parameter is the word (optional, gets whole line otherwise)
o() {
  $(history | 
      tail -n 2 | 
      head -n 1 | 
      cut -d " " -f 3-) | 
  head -n $1 | 
  tail -n 1 | 
  awk " { print \$0$2 } "
}

# record the screen
# requires wmctrl, xwininfo and byzanz
# usage: rec <windowname> <seconds> <filename>
# filename should end in flv, gif or ogg/ogv
function rec() {
  X=$(xwininfo -id $(wmctrl -l | grep -i "$1" | head -n 1 | awk '{print $1}') | grep 'Absolute upper-left X:' | awk "{ print \$NF }" )
  Y=$(xwininfo -id $(wmctrl -l | grep -i "$1" | head -n 1 | awk '{print $1}') | grep 'Absolute upper-left Y:' | awk "{ print \$NF }" )
  W=$(xwininfo -id $(wmctrl -l | grep -i "$1" | head -n 1 | awk '{print $1}') | grep 'Width:' | awk "{ print \$NF }" )
  H=$(xwininfo -id $(wmctrl -l | grep -i "$1" | head -n 1 | awk '{print $1}') | grep 'Height:' | awk "{ print \$NF }" )
  echo In 3 seconds will record window "$1" at $X,$Y size $W,$H for $2 seconds to file "$3"
  sleep 3;
  echo Recording
  byzanz-record --x=$X --y=$Y --width=$W --height=$H --delay=0 -c -d $2 "$3"
  echo Done
}
