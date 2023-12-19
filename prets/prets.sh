#!/bin/bash

while true; do
  choix=$(zenity --width=200 --height=120 --question \
          --title="Menu" \
          --text="Que voulez-vous faire?" \
          --extra-button="Ajouter un Pret" \
          --extra-button="Rechercher un Pret" \
          --extra-button="Quitter")

  case $choix in
    "Ajouter un Pret")
      /home/user/Desktop/prets/ajoutePr.sh
      ;;
    "Rechercher un Pret")
      /home/user/Desktop/prets/rechercheP.sh
      ;;
    "Quitter")
      exit
      ;;
    *)
      echo "Choix invalide"
      ;;
  esac
done
         
