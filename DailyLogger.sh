#! /usr/bin/bash

#location of daily_log
daily_log="Documents/System/Daily_Logs/daily_log.txt"

echo "Welcome to the Daily Logger!"
echo " "
echo "The current date is: "
date +'(%T) %A, %B %d, %Y:'
echo ""


echo "Please type what you've done today below!"
echo ""

read daily_content

echo ""
echo "The below will be printed into your daily logger"
echo ""

date +'(%T) %A, %B %d, %Y:'
echo $daily_content
echo ""

echo "Proceed? (y/n)"

read answer

if [[ $answer == "y" ]]
then 
	date +'(%T) %A, %B %d, %Y:' >> $daily_log
	echo "" >> $daily_log
	echo $daily_content >> $daily_log
       	echo "Daily Log was successfully appended!"
	echo "_________________________________________" >> $daily_log

else 
	echo "Content was not appended to daily log"
fi
#if answer == no then exit, if answer === y then append to daily content


