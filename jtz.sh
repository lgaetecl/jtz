#!/bin/bash

JREList=/tmp/JREList.txt
JavaClass=PrintDate
FIX=http://www.iana.org/time-zones/repository/tzdata-latest.tar.gz

findJRE()
{
    find $1 -name java -type f > $JREList
    if [ $? -ne 0 ]
    then
        echo "Check if this find installed "
    fi
}

CheckTimeZone()
{
    while read x
    do
        echo -e "Path Java: $x"
        echo -e "Version TZ:"
        $x -jar java/tzupdater.jar -V | grep "JRE tzdata"
        $x $JavaClass $DAYS
        echo -e "\n"
    done < $JREList 

}

FixTimeZone()
{
    while read x
    do
        echo -e "Path Java: $x"
        echo -e "Version TZ Previous:"
        $x -jar java/tzupdater.jar -V | grep "JRE tzdata"
        echo -e "\n"
        $x -jar java/tzupdater.jar -l $FIX
        echo -e "\nVersion TZ Current:"
        $x -jar java/tzupdater.jar -V | grep "JRE tzdata"
        $x $JavaClass $DAYS
        echo -e "\n"
    done < $JREList
}

while test $# -gt 0
do
    case "$1" in
        -h|--help)
            shift
            echo -e "options:"
            echo -e "\t -h, --help                show brief help"
            echo -e "\t -c, --command             specify an action to use: \n \t\t check: to perform a validation of the JVMs \n \t\t update: to update the JVMs"
            echo -e "\t -dir                      Optional, specify a directory to check or update JVMs"
            echo -e "\t -day                      Optional, specify the number of days you would like to validate in the future"
            echo -e "\n\tExample Command: \n\n \t sh CheckJTZ.sh -c check -dir / -day 10 \n \t sh CheckJTZ.sh -c update -dir / -day 10"
            exit 0
            ;;
        -c|--command)
            shift
            COMMAND=$1
            ;;
        -dir)
            shift
            DIR=$1
            ;;
        -day)
            shift
            DAYS=$1
            ;;
        *)
            shift
            echo "Invalid Option"
    esac
    shift
done

if [ -z $DIR ]
then
    findJRE /
else 
    findJRE $DIR
fi

if [ $COMMAND == "check" ]
then
    CheckTimeZone
fi

if [ $COMMAND == "update" ]
then
    FixTimeZone
fi

if [ -f $JREList ]
then
    rm -rf $JREList
fi