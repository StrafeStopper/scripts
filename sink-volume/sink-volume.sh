#!/bin/bash

# `chmod 777 sink-volume.sh` if needed to make it executable

# syntax `./sink-volume $SINK_APP $VOL_STEP`
# use `pactl list sink-inputs` to see all apps that can be adjusted
# $VOL_STEP must be "+x" or "-x" to indicate the operator for volume change

# example:
# ./sink-volume spotify +10

SINK_APP=$1
VOL_STEP=$2

# sets volume for $SINKAPP
function setVol()
{
	 pactl set-sink-input-volume $sink $OUT_VOL%
}

# gets the sink binary index so we can adjust it
function getSink()
{
	sinks=$(pactl list sink-inputs)
	sinkbinaryindex=$(awk -v sinks="$sinks" -v app="$SINK_APP" 'BEGIN {print index(sinks,app)}'  )
	sink=$(echo "${sinks:0:$sinkbinaryindex}" | tr "\n" "[racecar]" | rev | tr "[racecar]" "\n" | grep -m 1 "tupnI" | tr -d "#" | awk '{print $1}' | rev )
	echo "$cutatapprev"
}

# execute logic

getSink
OUT_VOL=$VOL_STEP
setVol
exit