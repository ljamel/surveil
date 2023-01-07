# surveil
detect intrusion
Ce script permet de surveiller un dossier et de vérifier si son MD5sum a changé. Si le MD5sum du dossier a changé, un mail sera envoyé à l'utilisateur pour le prévenir.

Pour utiliser ce script, vous devez d'abord le télécharger sur votre ordinateur. Une fois téléchargé, ouvrez le et exécutez-le en tant qu'utilisateur root avec la commande suivante : 

git clone https://github.com/ljamel/surveil.git

cd surveil

sudo ./script.sh

Vous serez alors invité à choisir un dossier à surveiller. Entrez alors le chemin absolu du dossier que vous souhaitez surveiller et le script s'occupera du reste. 
