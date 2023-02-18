#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"


TRY_="Please try again."


MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1\nPlease try again.\n\n"
  fi

  SERVICES_LIST=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\nPlease enter the number of the service you want to sign up for:"
  read SERVICE_ID_SELECTED; EXIT $SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "That is not a valid service number."
  else
    if [[ -z $($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED") ]]
    then
      MAIN_MENU "Sorry, we don't have any service available right now."
    fi
  fi
  
}

EXIT() {
  if [[ $1 == q ]]
  then
    echo -e "\nThank you for visit."
    exit
  fi
}


MAIN_MENU
