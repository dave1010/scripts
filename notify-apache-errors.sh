# use ubuntu's notification system to let us know when there's something new in the apache error log
tail -n0 -f /var/log/apache2/error.log | while read line
do
	body=`echo $line | cut -f 9- -d ' '`
	notify-send -c im.received -i error "Apache / PHP error" "$body"
done

