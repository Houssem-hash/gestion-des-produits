#!/bin/bash

# Demander les informations de l'emprunteur avec Zenity
nom=$(zenity --entry --title="Nouvel emprunteur" --text="Nom : ")
adresse=$(zenity --entry --title="Nouvel emprunteur" --text="Adresse : ")
email=$(zenity --entry --title="Nouvel emprunteur" --text="Adresse e-mail : ")

# Vérifier si l'emprunteur existe déjà
exist=$(mysql -u root -p -e "SELECT COUNT(*) FROM bibliotheque.Emprunteurs WHERE nom='$nom'")

if [ "$exist" -gt 0 ]
then
  zenity --error --text="L'emprunteur $nom existe déjà."
else
  # Ajouter l'emprunteur à la base de données
  mysql -u root -p -e "INSERT INTO bibliotheque.Emprunteurs (nom, adresse, email) VALUES ('$nom', '$adresse', '$email')"
  zenity --info --text="L'emprunteur $nom a été ajouté à la base de données."
fi
