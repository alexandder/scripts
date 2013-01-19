#!/bin/bash                                                                        

LICZBALINII=`wc -l words.txt | cut -f1 -d' '`
LOS=$RANDOM
let LOS=LOS%LICZBALINII+1
SLOWO=`sed -n "$LOS p" words.txt`
echo "$SLOWO"
