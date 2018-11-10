#!/bin/bash
for i in "$@"
do
case $i in
    -oa=*|--offsetabend=*)
    offabend="${i#*=}"
    shift # past argument=value
    ;;
    -om=*|--offsetmorgen=*)
    offmorgen="${i#*=}"
    shift # past argument=value
    ;;
    -d|--debug)
    debug="true"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

while true; do

    dusk=`date -d "$(python getsun.py rising)" +%s`
    if [ "$offmorgen" -gt "0" ]; then
	dusk="$(($dusk+$offmorgen))"
    fi

    dawn=`date -d "$(python getsun.py dawn)" +%s`
    if [ "$offabend" -gt "0" ]; then
        dawn="$(($dawn-$offabend))"
    fi
    timestamp=$(date +%s)
    statusGpio="$(/usr/local/bin/gpio -g read 21)"
    if [ "$timestamp" -gt "$dusk" ] && [ "$timestamp" -lt "$dawn" ]; then
        if [ "$statusGpio" == 0 ]; then
            /usr/local/bin/gpio -g write 21 1
        fi
        if [ "$debug" == true ]; then
            echo "Status der Funktion: Tag"
        fi
    else
        if [ "$statusGpio" == "1" ]; then
            /usr/local/bin/gpio -g write 21 0
        fi
        if [ "$debug" == true ]; then
            echo "Status der Funktion: Nacht"
        fi
    fi


    if [ "$debug" == true ]; then
        echo Sonnenaufgang um:
        date -d @$dusk
        echo Sonnenuntergang:
        date -d @$dawn
        if [ "$statusGpio" == "1" ]; then
            echo Status Licht: aus
	else
            echo Status Licht: an
        fi
    fi


sleep 3
done
