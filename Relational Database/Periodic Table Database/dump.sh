#!/bin/bash

echo -e "\n\n~~~~~~ Dump menu ~~~~~~\n"


PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"


MAIN_MENU() {
  
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome. What do you want to do?"
  fi

  echo -e "\n1. Make a dump \n2. Rebuild database \n3. Exit \n"
  
  read -p "Your choice: " USER_ANSWER

  case $USER_ANSWER in
    1) DO_MAKE ;;
    2) DO_REBUILD ;;
    3) DO_EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac

}


DO_MAKE() {
  pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
}


DO_REBUILD() {
  DROP_ACTION=$($PSQL "DROP DATABASE periodic_table;")
  psql -U postgres < periodic_table.sql
}


DO_EXIT() {
  echo -e "\n Thank you.\n"
}


MAIN_MENU
