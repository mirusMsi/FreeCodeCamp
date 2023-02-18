#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"


MAIN_MENU() {

  SERVICES_LIST=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\n0) Exit"

  echo -e "\nPlease enter the number of the service you want to sign up for:"
  read SERVICE_ID_SELECTED

  EXIT $SERVICE_ID_SELECTED
  
}

EXIT() {
  if [[ $1 == 0 ]]
  then
    echo -e "\nThank you for visit."
    exit
  fi
}


MAIN_MENU
