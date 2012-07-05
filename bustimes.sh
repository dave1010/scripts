#!/bin/bash

URLS='
http://nextbuses.mobi/WebView/BusStopSearch/BusStopSearchResults/plegjpa?searchType=route&searchFilter=1C
http://nextbuses.mobi/WebView/BusStopSearch/BusStopSearchResults/plegjpa?searchType=route&searchFilter=18
'

echo "Now:" `date +%H:%M:%S`

for URL in $URLS; do 
    echo "$URL:" | sed 's/.*=.*=/Route /'
    curl -s $URL \
        | grep '"Stops"' \
        | grep '[0-9]' \
        | sed 's/.*;//' \
        | sed 's/<\/p>//'
done





