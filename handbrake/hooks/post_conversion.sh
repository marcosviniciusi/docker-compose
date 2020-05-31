#!/bin/sh
#
# This is an example of a post-conversion hook.  This script is always invoked
# with /bin/sh (shebang ignored).
#
# The first parameter is the conversion status.  A value of 0 indicates that
# the video has been converted successfully.  Else, conversion failed.
#
# The second parameter is the full path to the converted video (the output).
#
# The third parameter is the full path to the source file.
#
# The fourth argument is the name of the HandBrake preset used to convert the
# video.
#

CONVERSION_STATUS=$1
CONVERTED_FILE="$2"
SOURCE_FILE="$3"
PRESET="$4"
DIR=$(dirname "${SOURCE_FILE}")
FILENAME=$(basename "${CONVERTED_FILE}")
NEW_CONVERTED_FILE="${DIR}/${FILENAME}"

echo "post-conversion: Status = $CONVERSION_STATUS"
echo "post-conversion: Output File = $CONVERTED_FILE"
echo "post-conversion: Source File = $SOURCE_FILE"
echo "post-conversion: Preset = $PRESET"
echo "post-conversion: Destination Full Path = $NEW_CONVERTED_FILE"

if [ "$CONVERSION_STATUS" -eq 0 ]; then
    # Successful conversion.
    rm -f $SOURCE_FILE
    mv $CONVERTED_FILE $NEW_CONVERTED_FILE
    echo "Copia com sucesso de $CONVERTED_FILE para $NEW_CONVERTED_FILE"
else
    # Failed conversion.
    echo "Falha na conversao, nada a ser feito"
    # TODO: Do something useful.

fi
