#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"


ELEMENT() {

  JOIN=$($PSQL "
    SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
    FROM elements
    INNER JOIN properties USING(atomic_number)
    INNER JOIN types USING(type_id)
    WHERE $1;
  ")

  if [[ -z "$JOIN" ]]
  then
    CHECK="False"
  else

    echo "$JOIN" | while read INDEX BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING BAR BOILING
    do

      INDEX=$(echo $INDEX | sed 's/ |/"/')
      NAME=$(echo $NAME | sed 's/ |/"/')
      SYMBOL=$(echo $SYMBOL | sed 's/ |/"/')
      TYPE=$(echo $TYPE | sed 's/ |/"/')
      MASS=$(echo $MASS | sed 's/ |/"/')
      MELTING=$(echo $MELTING | sed 's/ |/"/')
      BOILING=$(echo $BOILING | sed 's/ |/"/')

      echo -e "The element with atomic number $INDEX is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

    done
  
  fi

}


BY_TEXT() {

  SYMBOL=$1

  ELEMENT "symbol = '$SYMBOL'"

  if [[ $CHECK == "False" ]]
  then

    CHECK="True"
    ELEMENT "name = '$SYMBOL'"
    EXIT_MSG
  
  fi

}


MSG() {
  echo -e "Please provide an element as an argument."
}


EXIT_MSG() {
  if [[ $CHECK == "False" ]]
  then
    echo "I could not find that element in the database."
  fi
}


CHECK="True"


if [[ $# -eq 0 ]]
then
  MSG
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT "atomic_number = $1"
    EXIT_MSG
  else
    if [[ $1 =~ ^[a-Z]+$ ]]
    then
      BY_TEXT $1
    else
      MSG
    fi
  fi
fi
