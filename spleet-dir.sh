#!/bin/bash

DEFAULT_DIRECTORY="/mnt/c/Users/skijit/Desktop/export-test"

DIRECTORY="${1:-$DEFAULT_DIRECTORY}"
FILES="${DIRECTORY}/*"
FILE_LIST=""
for f in $FILES
do
  FILE_LIST+="input/`basename ${f}` "
done

STEM_RUN_2_INSTRUMENT="docker run -v ${DIRECTORY}:/output -v ${DIRECTORY}:/input  deezer/spleeter:3.8 separate -o /output ${FILE_LIST} -f {filename}/2-stems/{instrument}-{filename}.{codec}"
echo "Running 2 Instrument Stem-Creation..."
eval "$STEM_RUN_2_INSTRUMENT"

STEM_RUN_4_INSTRUMENT="docker run -v ${DIRECTORY}:/output -v ${DIRECTORY}:/input  deezer/spleeter:3.8 separate -o /output -p spleeter:4stems ${FILE_LIST} -f {filename}/4-stems/{instrument}-{filename}.{codec}"
echo "Running 4 Instrument Stem-Creation..."
eval "$STEM_RUN_4_INSTRUMENT"