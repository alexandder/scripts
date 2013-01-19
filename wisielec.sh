#!/bin/bash                                                                        

WORD="computer"
LEN=${#WORD}
UNKW=""
i=0;
while [ $i -le $LEN ]; do
  UNKW=$UNKW"_"
	i=$[i+1]
done
tempWord=$WORD
while [ "$UNKW" != "$WORD" ]; do
        echo "The word has $LEN characters"
	echo "$UNKW"
        echo "Please, give a character: "
        read char
        if [[ "$WORD" =~ "$char" ]]; then
                UNKW=$UNKW$char
        else

	fi

done
