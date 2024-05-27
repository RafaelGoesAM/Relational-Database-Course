#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]  
  then
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
    if ! [[ -z $ELEMENT_SYMBOL ]]
    then
      $PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number='$1'" | while IFS=" | " read -r NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        exit 0
      done
    else
      echo -e "I could not find that element in the database."
    fi
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
    if ! [[ -z $ELEMENT_NAME ]]
    then
      $PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.symbol='$1'" | while IFS=" | " read -r NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        exit 0
      done
    else
      echo -e "I could not find that element in the database."
    fi
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$1'")
    if ! [[ -z $ELEMENT_SYMBOL ]]
    then
      $PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.name='$1'" | while IFS=" | " read -r NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        exit 0
      done
    else
      echo -e "I could not find that element in the database."
    fi
  else
    echo -e "I could not find that element in the database."
  fi
else
  echo -e "Please provide an element as an argument."
fi
