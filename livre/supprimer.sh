#!/bin/bash
# Script pour supprimer un livre de la base de données bibliotheque

# Demander l'ISBN du livre à supprimer
isbn=$(zenity --entry --title="Supprimer un livre" --text="Entrez l'ISBN du livre à supprimer :")
# Vérifier si le livre existe dans la base de données
if [[ $(mysql -u root -p -s -N -e "SELECT COUNT(*) FROM Livres WHERE isbn='$isbn';" bibliotheque) -eq 0 ]]; then
zenity --error --title="Erreur" --text="Le livre avec l'ISBN $isbn n'existe pas dans la base de données."
exit 1
fi

# Supprimer le livre de la base de données
mysql -u root -p -e "DELETE FROM Livres WHERE isbn='$isbn';" bibliotheque

zenity --info --title="Succès" --text="Le livre avec l'ISBN $isbn a été supprimé de la base de données."
