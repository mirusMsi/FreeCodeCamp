#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"


SERVICES_LIST() {

  SERVICES=$($PSQL "
    SELECT service_id, name 
    FROM services
    ORDER BY service_id;
  ")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

}


START_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  SERVICES_LIST

  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "
    SELECT name
    FROM services
    WHERE service_id = $SERVICE_ID_SELECTED;
  ")

  if [[ -z $SERVICE_NAME ]]
  then
    START_MENU "I could not find that service. What would you like today?"
  fi

}


CUSTOMER_MENU() {

  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "
    SELECT name
    FROM customers
    WHERE phone = '$CUSTOMER_PHONE';
  ")

  if [[ -z $CUSTOMER_NAME ]]
  then
    REG_MENU $SERVICE_ID_SELECTED $SERVICE_NAME $CUSTOMER_PHONE
  fi

}


REG_MENU() {
  
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2
  CUSTOMER_PHONE=$3

  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  INSERT_CUSTOMER=$($PSQL "
    INSERT INTO customers(name, phone)
    VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');
  ")

  if [[ $INSERT_CUSTOMER != "INSERT 0 1" ]]
  then
    START_MENU "Something wrong."
  fi

}


SET_MENU() {
  
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2
  CUSTOMER_PHONE=$3

  CUSTOMER_ID=$($PSQL "
    SELECT customer_id
    FROM customers
    WHERE phone = '$CUSTOMER_PHONE';
  ")

  CUSTOMER_NAME=$($PSQL "
    SELECT name
    FROM customers
    WHERE phone = '$CUSTOMER_PHONE';
  ")

  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ |/"/')

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  SERVICE_TIME=$(echo $SERVICE_TIME | sed 's/ |/"/')

  INSERT_APPOINTMENT=$($PSQL "
    INSERT INTO appointments(customer_id, service_id, time)
    VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');
  ")

  if [[ $INSERT_APPOINTMENT != "INSERT 0 1" ]]
  then
    START_MENU "Could not schedule appointment, please schedule another service or try again later."
  fi

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}


START_MENU "Welcome to My Salon, how can I help you?"

CUSTOMER_MENU $SERVICE_ID_SELECTED $SERVICE_NAME

SET_MENU $SERVICE_ID_SELECTED $SERVICE_NAME $CUSTOMER_PHONE
