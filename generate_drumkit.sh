#!/bin/bash
declare -A replaces
while [ $# -gt 0 ]
do
      case "$1" in
              #-v)  vflag=on;;
              #-f)  filename="$2"; shift;;
              --*)  parameter=${1#--}
                    key=${parameter%=*}
                    value=${parameter#*=}
                    replaces[${key}]=${value}
                    ;;
              -*)
                echo >&2 \
                   "usage: $0 [--key=value] [SAMPLE_DIR] [NAME_OF_DRUMKIT]"
                exit 1;;
              *)  break;;
              #      terminate while loop
      esac
      shift
done

SAMPLES_DIR=$1
NAME=$2
HYDROGEN_DIR="$HOME/.hydrogen/data/drumkits"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -d $1 ]]
then
	cd $SAMPLES_DIR
	if [[ ! -d "$HYDROGEN_DIR/$NAME" ]]
	then
		mkdir -p $HYDROGEN_DIR/$NAME
  fi
 
  instrumentlist=""
  (IFS='
'
for file in $(ls | grep -Ei '\.(ogg|wav|flac)'); do
    cp "${file}" $HYDROGEN_DIR/$NAME/
    echo "Copying $file to $HYDROGEN_DIR/$NAME/$file"
		instrumentlist="$instrumentlist `cat $SCRIPT_DIR/ressources/instrument.txt | sed -e "s/__FILENAME__/$file/g"`"
	done
  for i in "${!replaces[@]}"
  do
    instrumentlist=`printf "%s" "$instrumentlist" | sed -e "s#\(<$i>\)\(.*\)\(</$i>\)#\1${replaces[$i]}\3#g"`
  done
  cat $SCRIPT_DIR/ressources/instrumentlist_header.txt | sed -e "s/__NAME__/$NAME/" > $HYDROGEN_DIR/$NAME/drumkit.xml
  printf "%s" "$instrumentlist" >> $HYDROGEN_DIR/$NAME/drumkit.xml
  cat $SCRIPT_DIR/ressources/instrumentlist_footer.txt >> $HYDROGEN_DIR/$NAME/drumkit.xml
)
else
	echo "Directory $1 is not valid."
  echo "usage: $0 [--key=value] [SAMPLE_DIR] [NAME_OF_DRUMKIT]"
fi
