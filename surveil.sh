#!/bin/bash

# Installation du paquet bsd-mailx
sudo apt-get install bsd-mailx

# Demande de choisir un dossier
echo "Veuillez choisir un dossier :"
read chemin

# Demande votre mail
echo "Veuillez mail :"
read mail

# Vérifie que le dossier existe
if [ -d "$chemin" ]; then
	# Création du fichier texte
	touch md5sum.txt
	
	# Calcul du md5sum du dossier home
	md5sum "$chemin"/* > md5sum.txt
	
	# Vérification du MD5sum
	while true;
	do
		# Récupération du MD5sum
		md5=`md5sum "$chemin"/*`
		
		# Si le md5 n'est pas égal au précédent
		if [ "$md5" != "$oldmd5" ]; then
			echo "Le MD5sum a changé !"
			# Mise à jour du md5
			oldmd5="$md5"
			
			# Envoie du mail
			echo "Le MD5sum du dossier $chemin a changé !" | mail -s "MD5sum changé" $mail
			
			# mise à jours du md5
			md5sum "$chemin"/* > md5sum.txt
		fi
		
		# Attente de 10 secondes avant une nouvelle vérification
		sleep 10
	done
else
	echo "Dossier invalide !"
	exit 1
fi
