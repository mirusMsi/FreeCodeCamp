#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"


GET_USER_ID() {
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
}


GET_GAMES_INFO() {
  INFO=$($PSQL "
    SELECT $1
    FROM users
    INNER JOIN games USING (user_id)
    WHERE user_id = $USER_ID
    GROUP BY username;
  ")
}


WIN() {

  INSER=$($PSQL "INSERT INTO games(user_id, attempts) VALUES ($USER_ID, $ATTEMPTS);")

  echo "You guessed it in $ATTEMPTS tries. The secret number was $NUMBER. Nice job!"

}

GET_INPUT() {

  read INPUT

  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then

    echo "That is not an integer, guess again:"
    GET_INPUT

    exit

  fi

  ATTEMPT

}


ATTEMPT() {

  ATTEMPTS=$(($ATTEMPTS+1))

  if [[ $INPUT == $NUMBER ]]
  then
    WIN
  else

    if [[ $INPUT > $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi

    GET_INPUT
  
  fi

}


echo "Enter your username: "
read USERNAME

GET_USER_ID

if [[ -z $USER_ID ]]
then

  INSERT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
  GET_USER_ID

  echo "Welcome, $USERNAME! It looks like this is your first time here."

  CHECK='TRUE'

else

  GET_GAMES_INFO "COUNT(*)"
  GAMES_PLAYED=$INFO
  GAMES_PLAYED=$(echo $GAMES_PLAYED | sed 's/ |/"/')
  
  GET_GAMES_INFO "MIN(attempts)"
  BEST_GAME=$INFO
  BEST_GAME=$(echo $BEST_GAME | sed 's/ |/"/')

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi

NUMBER=$(($RANDOM%1000+1))

ATTEMPTS=0

echo "Guess the secret number between 1 and 1000:"
GET_INPUT
