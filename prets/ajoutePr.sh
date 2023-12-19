#!/bin/bash

# Demander les informations sur le prêt
livre_id=$(zenity --entry --text "ID du livre : " 2>/dev/null)
emprunteur_id=$(zenity --entry --text "ID de l'emprunteur : " 2>/dev/null)
date_emprunt=$(zenity --calendar --date-format=%Y-%m-%d --text "Date d'emprunt : " 2>/dev/null)
date_echeance=$(zenity --calendar --date-format=%Y-%m-%d --text "Date d'échéance : " 2>/dev/null)
date_retour=$(zenity --calendar --date-format=%Y-%m-%d --text "Date de retour (laisser vide si non retourné) : " 2>/dev/null)

# Exécuter la requête SQL pour insérer le prêt
mysql -u root -p -e "USE bibliotheque; INSERT INTO Prets (livre_id, emprunteur_id, date_emprunt, date_echeance, date_retour) VALUES ('$livre_id', '$emprunteur_id', '$date_emprunt', '$date_echeance', '$date_retour');"

zenity --info --text "Le prêt a été ajouté à la base de données." 2>/dev/null
