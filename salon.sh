#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e
#PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  echo "$($PSQL "SELECT * FROM services")" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  echo -e "\nWhat''s your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "\nI don''t have a record for that phone number, what''s your name?"
    read CUSTOMER_NAME
    ADD_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME

  ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointment(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $ADD_APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then
    echo e- "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    exit
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"