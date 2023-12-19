#!/bin/bash

# Demander les critères de recherche
livre_id=$(zenity --entry --text "ID du livre (laissez vide pour ignorer) : " 2>/dev/null)
emprunteur_id=$(zenity --entry --text "ID de l'emprunteur (laissez vide pour ignorer) : " 2>/dev/null)

# Construire la requête SQL en fonction des critères de recherche
query="SELECT * FROM Prets WHERE 1=1"
if [[ -n "$livre_id" ]]; then
  query+=" AND livre_id='$livre_id'"
fi
if [[ -n "$emprunteur_id" ]]; then
  query+=" AND emprunteur_id='$emprunteur_id'"
fi

# Exécuter la requête SQL et afficher les résultats
results=$(mysql -u root -p -B -e "USE bibliotheque; $query")

# Afficher les résultats dans une boîte de dialogue Zenity
if [[ -n "$results" ]]; then
echo -e "id\tlivre_id\temprunteur_id\tdate_emprunt\tdate_echeance\tdate_retour"
  echo "$results" | while IFS=$'\t' read -r id livre_id emprunteur_id date_emprunt date_echeance date_retour; do
    echo -e "$id\t$livre_id\t$emprunteur_id\t$date_emprunt\t$date_echeance\t$date_retour"
  
done | zenity --text-info --width=800 --height=600 --title "Résultats de la recherche" 2>/dev/null
else
  zenity --info --text="Aucun prêt ne correspond aux critères de recherche." 2>/dev/null
fi
