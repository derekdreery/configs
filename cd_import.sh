#!/bin/bash

for i in $(seq -f "%02g" 1 11)
do
    SONG_NAME=$(awk "/^Tracktitle/ { print }" <audio_${i}.inf | sed -rn "s/^Tracktitle=\s'(.*)'$/\\1/p")
    echo Moving $SONG_NAME ...
    cp "audio_${i}.wav" "${SONG_NAME}.wav"
done
