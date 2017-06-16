#!/bin/bash

#!!!REPLACE CAPS ELEMENTS WITH YOUR OWN!!!
#There are two websites here, so there are two emails.
#This is by design, but could be scaled or combined into one.

#website singularity-hub RSS feed is wgetted
filename="singularity-hub"
url="https://singularityhub.com/feed/"
output="<PATH_TO_FILE>/$filename.html"
#sed is used to remove as much of the xml data as possible
wget -qO- $url | sed -e 's/<[^>]*>//g;s/^ //g' > $output
wkhtmltopdf $output <PATH_TO_FILE>.pdf

echo "<EMAIL_BODY>" | mutt -a "<PATH_TO_FILE>" -s "<EMAIL_SUBJECT>" -- <RECIEVING EMAIL>
echo "Job Completed"

filenamez="torrentfreak"
urlz="http://feeds.feedburner.com/Torrentfreak"
outputz="<PATH_TO_FILE>$filenamez.html"
wget -qO- $urlz | sed -e 's/<[^>]*>//g;s/^ //g' > $outputz
wkhtmltopdf $outputz <PATH_TO_FILE>/$filenamez.pdf

echo "<EMAIL_BODY>" | mutt -a "<PATH_TO_FILE>" -s "<EMAIL_SUBJECT>" -- <RECIEVING EMAIL>
echo "Job Completed"

cd <PATH_TO_FILE>
rm *.html
