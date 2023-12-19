#!/bin/bash

# Script pour ajouter un livre à la base de données bibliotheque

# Demander les informations sur le livre avec Zenity
titre=$(zenity --entry --title="Ajout d'un livre" --text="Entrez le titre : ")
auteur=$(zenity --entry --title="Ajout d'un livre" --text="Entrez l'auteur : ")
editeur=$(zenity --entry --title="Ajout d'un livre" --text="Entrez l'éditeur : ")
date_publication=$(zenity --entry --title="Ajout d'un livre" --text="Entrez la date de publication (AAAA-MM-JJ) : ")
isbn=$(zenity --entry --title="Ajout d'un livre" --text="Entrez l'ISBN : ")

# Valider les entrées utilisateur
if [[ $(mysql -u root -p -s -N -e "USE bibliotheque; SELECT COUNT(*) FROM Livres WHERE isbn='$isbn'") -ne 0 ]]; then
  zenity --error --text="Le livre avec l'ISBN $isbn existe déjà dans la base de données."
  exit 1
fi

mysql -u root -p -e "USE bibliotheque; INSERT INTO Livres (titre, auteur, editeur, date_publication, isbn) VALUES ('$titre', '$auteur', '$editeur', '$date_publication', '$isbn')"

zenity --info --text="Le livre \"$titre\" a été ajouté à la base de données."
