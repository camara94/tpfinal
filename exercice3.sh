#!/bin/sh

username=$1
password=$2

#Je recupere les uid des utilisateur ici 
for i in $(cat /etc/passwd | cut -d ":" -f 1);                                
do  
    #Je vérifie si l'utilisateur existe
    if [ $i = $username ]; then 
       echo "L'utilisateur \"$i\" existe déjà"
       exit 0
    else 
	echo "Creation d'un compte utilisateur"
        if [ -z $username ] && [ -z $username ]; then
	  echo "Vous devez passer le login et le mot de passe en paramètre du script"
	else
	  sudo useradd -c "$username" -m "$username" -p "$password" 
	fi
       exit 0
    fi  
done
exit 0
