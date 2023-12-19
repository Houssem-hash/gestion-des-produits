#!/bin/bash

# Demander les critères de recherche
titre=$(zenity --entry --title "Recherche de livres" --text "Titre (laissez vide pour ignorer) : ")
auteur=$(zenity --entry --title "Recherche de livres" --text "Auteur (laissez vide pour ignorer) : ")
isbn=$(zenity --entry --title "Recherche de livres" --text "ISBN (laissez vide pour ignorer) : ")

# Construire la requête SQL en fonction des critères de recherche
query="SELECT * FROM Livres WHERE 1=1"
if [[ -n "$titre" ]]; then
  query+=" AND titre LIKE '%$titre%'"
fi
if [[ -n "$auteur" ]]; then
  query+=" AND auteur LIKE '%$auteur%'"
fi
if [[ -n "$isbn" ]]; then
  query+=" AND isbn='$isbn'"
fi

# Exécuter la requête SQL et afficher les résultats
results=$(mysql -u root -p -N -e "$query" bibliotheque)
if [[ -z "$results" ]]; then
  zenity --info --text "Aucun livre trouvé."
else
  zenity --text-info --width=800 --height=600 --title="Résultats de la recherche"  <<< "$results"
fi
