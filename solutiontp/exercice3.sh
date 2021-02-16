#!/bin/sh
username=$1
password=$2

for i in $(cat /etc/passwd | cut -d ":" -f 1);                                
do  
    #Je vérifie si l'utilisateur existe
    if [ $# -gt 0 ] && [ $i = $username ] ; then 
       echo "L'utilisateur \"$i\" existe déjà"
       exit 0   
    fi
done

#Je recupere les uid des utilisateur ici 
for i in $(cat /etc/passwd | cut -d ":" -f 1);                                
do  
    if [ $# -eq 0 ]; then
	echo "Vous devez passer le login le mot de passe en paramètre du script"
        exit 0
     elif [ $# -eq 1 ]; then
	echo "Vous devez passer le mot de passe en paramètre du script"
        exit 0
     else
	sudo useradd -c "$username" -m "$username" -p "$password" 
        exit 0
     fi
     exit 0
done
exit 0
