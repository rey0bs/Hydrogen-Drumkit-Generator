#!/bin/bash
SAMPLES_DIR=$1
#TARGET_DIR=$2
NAME=$2
HYDROGEN_DIR="$HOME/.hydrogen/data/drumkits"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#EZDIR=$2
echo $DIR
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
	for file in $(ls | grep '.ogg'); do
    cp "${file}" $HYDROGEN_DIR/$NAME/
    echo "Copying $file to $HYDROGEN_DIR/$NAME/$file"
		instrumentlist="$instrumentlist `cat $SCRIPT_DIR/instrument.txt | sed -e "s/__FILENAME__/$file/g"`"
	done
 echo "BEGIN $instrumentlist END" 
  cat $SCRIPT_DIR/instrumentlist_header.txt | sed -e "s/__NAME__/$NAME/" > $HYDROGEN_DIR/$NAME/drumkit.xml
  printf "%s" "$instrumentlist" >> $HYDROGEN_DIR/$NAME/drumkit.xml
  cat $SCRIPT_DIR/instrumentlist_footer.txt >> $HYDROGEN_DIR/$NAME/drumkit.xml
)
else
	echo "Directory $i is not valid."
  echo "     Calling : ./hydrogenkit.sh [SAMPLE_DIR] [NAME_OF_DRUMKIT]"
fi
