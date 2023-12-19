#!/bin/bash

# Récupérer le nom de l'emprunteur à rechercher
nom=$(zenity --entry --title="Rechercher un emprunteur" --text="Nom :")

# Rechercher l'emprunteur dans la base de données
result=$(mysql -u root -p -D bibliotheque -e "SELECT * FROM Emprunteurs WHERE nom LIKE '%$nom%'")

if [ -z "$result" ]
then
  zenity --info --title="Résultats de la recherche" --text="Aucun emprunteur trouvé pour la recherche '$nom'."
else
  zenity --info --title="Résultats de la recherche" --text="Résultats de la recherche pour '$nom':\n\n$result"
fi
