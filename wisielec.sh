#!/bin/bash                                                                        

function draw {                                                                        
numb=$1

case "$numb" in
   "1")  echo ""
         echo "|"
         echo "|"
	 echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
	 echo "|"
         echo "|"
         echo "|"
         echo "|" ;;
   "2")  echo ""
         echo "|---------------"
         echo "|"
      	 echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|" ;;

   "3")  echo ""
         echo "|---------------"
         echo "|              ?"
         echo "|             / \ "
         echo "|             \ / "
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|"
         echo "|" ;;

   "4")  echo ""
         echo "|---------------"
         echo "|              ?"
         echo "|             / \ "
         echo "|             \ / "
         echo "|              |  "
         echo "|              |  "
         echo "|              |   "
         echo "|              |  "
         echo "|"
         echo "|"
         echo "|" ;;

   "5")  echo ""
         echo "|---------------"
         echo "|              ?"
         echo "|             / \ "
         echo "|             \ / "
         echo "|              |  "
         echo "|             /|\  "
         echo "|            / | \  "
         echo "|              |   "
         echo "|"
         echo "|"
         echo "|" ;;

   "6")  echo ""
         echo "|---------------"
         echo "|              ?"
         echo "|             / \ "
         echo "|             \ / "
         echo "|              |  "
         echo "|             /|\  "
         echo "|            / | \  "
         echo "|              |   "
         echo "|             /     "
         echo "|            /      "
         echo "|" ;;
   "7")  echo ""
         echo "|---------------"
         echo "|              ?"
         echo "|             / \ "
         echo "|             \ / "
         echo "|              |  "
         echo "|             /|\  "
         echo "|            / | \  "
         echo "|              |   "
         echo "|             / \      "
         echo "|            /   \     "
         echo "|" 
         echo ""
	 echo "Przegrales!" ;;
    *)   echo ""
esac

}

function randWord() {
    LICZBALINII=`wc -l words.txt | cut -f1 -d' '`
    LOS=$RANDOM
    let LOS=LOS%LICZBALINII+1
    SLOWO=`sed -n "$LOS p" words.txt`
    echo "$SLOWO"
}


WORD=`randWord`
LEN=${#WORD}
UNKW=""
i=0;
while [ $i -lt $LEN ]; do
  UNKW=$UNKW"_"
  let i=i+1
done
tempWord=$WORD
ng=0
echo "Slowo ma $LEN znakow"
while [ "$UNKW" != "$WORD" ]; do
    if [[ $ng -le "6" ]]; then 
	echo "$UNKW"
        echo "Podaj znak: "
        read char
        if [[ "$tempWord" =~ "$char" && "${#char}" = "1" && "$char" != "" ]]; then     
	    ind=`expr index "$tempWord" "$char"`
	    UNKW=${UNKW:0:ind-1}$char${UNKW:ind}
	    tempWord=${tempWord:0:ind-1}"_"${tempWord:ind}
	    echo "Trafiles!"
	    echo ""
        else
	    echo "Nie trafiles"
	    let ng=ng+1
	    draw "$ng"
	    echo ""
	fi
    else
	let ng=ng+1
        draw "$ng"
	exit 0
    fi
done

echo "Slowo to $WORD"
echo "Wygrales!"
exit 0                                                                     


