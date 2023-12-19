#!/bin/bash

# Change directory to the script's location
cd "$(dirname "$0")"

while true; do
  choix=$(zenity --width=200 --height=100 --question \
          --title="Menu" \
          --text="Que voulez-vous faire?" \
          --extra-button="Ajouter un livre" \
          --extra-button="Supprimer un livre" \
          --extra-button="Rechercher un livre" \
          --extra-button="Quitter")

  case $choix in
    "Ajouter un livre")
      ./ajoute.sh
      ;;
    "Supprimer un livre")
      ./supprimer.sh
      ;;
    "Rechercher un livre")
      ./recherche.sh
      ;;
    "Quitter")
      exit
      ;;
    *)
      ;;
  esac
done
