#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
params="$(getopt -o ab:c -l alpha,bravo:,charlie --name "$0" -- "$@")"
eval set -- "$params"

PARSED_ARGUMENTS=$(getopt -a -n alphabet -o abc:d: --long alpha,bravo,charlie:,delta: -- "$@")
VALID_ARGUMENTS=$?
if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage
fi
#
echo "PARSED_ARGUMENTS is $PARSED_ARGUMENTS"
eval set -- "$PARSED_ARGUMENTS"

function usage {
        echo "Usage ./$(basename $0) -h --> shows usage"
}

#--alpha --bravo '   whitespace   FTW   ' --charlie
#-acb '   whitespace   FTW   '

while true
do
    case "$1" in
        -a|--alpha)
            echo alpha
            shift
            ;;
        -b|--bravo)
            echo "bravo=$2"
            shift 2
            ;;
        -c|--charlie)
            echo charlie
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Not implemented: $1" >&2
            exit 1
            ;;
    esac
done

option_info="this is INITIAL info"
option_cmd="NULL"

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

