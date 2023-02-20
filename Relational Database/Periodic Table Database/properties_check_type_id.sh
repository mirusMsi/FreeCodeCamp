#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"


PROPERTIES=$($PSQL "SELECT atomic_number, type, type_id FROM properties ORDER BY atomic_number;")

echo "$PROPERTIES" | while read INDEX BAR TYPE BAR TYPE_ID
do

  TYPE=$(echo $TYPE | sed 's/ |/"/')

  TYPES=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID;")
  TYPES=$(echo $TYPES | sed 's/ |/"/')

  if [[ $TYPE == $TYPES ]]
  then
    CHECK="RIGHT"
  else
    CHECK=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE';")
    CHECK=$($PSQL "UPDATE properties SET type_id = $CHECK WHERE atomic_number = $INDEX;")
  fi

  echo "RECORD ID: $INDEX; RESULT: $CHECK"

done
