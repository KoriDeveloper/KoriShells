#!/bin/sh
# Copyright (c) 2016 KoriDev
# All rights reserved

### Configs ###
ChannelDir="/home/game2/Channels"
Date=$(date "+%Y-%m-%d-%H-%M")
OutDir="/home/game2/ChannelLogs"


printf "Logs werden nun verschoben und sortiert...\n"
cd $ChannelDir/auth && mv syslog syslog_auth_"${Date}" && mv syserr syserr_auth_"${Date}" && cd .. 
cd $ChannelDir/db && mv syslog syslog_db_"${Date}" && mv syserr syserr_db_"${Date}" && cd ..
for i in $(seq 1 5)
	do
		cd $ChannelDir/channel1/"core${i}" && mv syslog syslog_channel1_"core${i}"_\"${Date}\" && mv syserr syserr_channel1_"core${i}"_\"${Date}\" && mv syserr_channel1_"core${i}"_\"${Date}\" "$OutDir" && mv syslog_channel1_"core${i}"_\"${Date}\" "$OutDir"
done
for i in $(seq 1 5)
	do
		cd $ChannelDir/channel2/"core${i}" && mv syslog syslog_channel2_"core${i}"_\"${Date}\" && mv syserr syserr_channel2_"core${i}"_\"${Date}\" && mv syserr_channel2_"core${i}"_\"${Date}\" "$OutDir" && mv syslog_channel2_"core${i}"_\"${Date}\" "$OutDir"
done
for i in $(seq 1 5)
	do
		cd $ChannelDir/game99/"core${i}" && mv syslog syslog_game99_"core${i}"_\"${Date}\" && mv syserr syserr_game99_"core${i}"_\"${Date}\" && mv syserr_game99_"core${i}"_\"${Date}\" "$OutDir" && mv syslog_game99_"core${i}"_\"${Date}\" "$OutDir"
done
