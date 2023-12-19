#!/bin/bash

while true; do
  choix=$(zenity --width=200 --height=150 --question \
          --title="Menu" \
          --text="Que voulez-vous faire?" \
          --extra-button="Ajouter un emprunteur" \
          --extra-button="Supprimer un emprunteur" \
          --extra-button="Rechercher un emprunteur" \
          --extra-button="Quitter")

  case $choix in
    "Ajouter un emprunteur")
      /home/user/Desktop/emprunteur/ajouteEM.sh
      ;;
    "Supprimer un emprunteur")
      /home/user/Desktop/emprunteur/supprimeEM.sh
      ;;
    "Rechercher un emprunteur")
      /home/user/Desktop/emprunteur/rechercheEM.sh
      ;;
    "Quitter")
      exit
      ;;
    *)
      echo "Choix invalide"
      ;;
  esac
done
