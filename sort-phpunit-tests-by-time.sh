grep time tests.xml | grep testcase | awk "{ print \$7 \$2 }"|sed 's/name="/ /g'|sed 's/time="//g'|sed 's/"\/>//g'|sed 's/"//g'|sort
