#!/bin/bash

# Récupérer le nom de l'emprunteur à supprimer
zenity --info --text="Supprimer un emprunteur"

nom=$(zenity --entry --title="Supprimer un emprunteur" --text="Nom :")

# Vérifier si l'emprunteur existe dans la base de données
exist=$(mysql -u root -p bibliotheque -e "SELECT COUNT(*) FROM Emprunteurs WHERE nom='$nom'")

if [ "$exist" -eq 0 ]
then
  zenity --warning --text="L'emprunteur $nom n'existe pas dans la base de données."
else
  # Supprimer l'emprunteur de la base de données
  mysql -u root -p bibliotheque -e "DELETE FROM Emprunteurs WHERE nom='$nom'"
  zenity --info --text="L'emprunteur $nom a été supprimé de la base de données."
fi
