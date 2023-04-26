#!/bin/bash

function usage {
        echo "Usage ./$(basename $0) -h --> shows usage"
}

usage

option_info="this is INITIAL info"
optino_cmd="NULL"

echo "info value initial='${option_info}'"
while getopt 'd:' OPTION; do
    case "${flag}" in
        d) option_cmd=${OPTARG}
            ;;
        #aa) option_cmd=${OPTARG};;
        *)
            echo "Usage: $0 [-d value]" >&2
            exit 1
            ;;
    esac
done

echo "cmd line option specified = ${option_cmd}"

option_info="this is NEW info"
echo "info value new='${option_info}'"

##output all space separated line items
echo "command line args are:"
i=1;
for arg in "$@"; do
    echo "arg[$i]=$arg";
    i=$((i + 1));
done

