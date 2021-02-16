#!/bin/sh

#Je recupere les uid des utilisateur ici 
for i in $(cat /etc/passwd | cut -d ":" -f 1) ;                                  
do  
    #Je vérifie si l'uid existe
    if test $i = $1;then                                                                            
     #Je recupere le nom de l'utilisateur dans la variable m ici                                               
     id $i | sed -e "s/ name groupes/\n\tgroupes/" | grep "uid" | cut -d " " -f 2 > /tmp/user_name.txt
     m=$(cat /tmp/user_name.txt)
     m=${m##*=}
     m=${m%%(*}
     #J'affiche l'utilisateurs ici
     echo "uid de l'utilisateur est :\"$m\""
     exit 0
    fi  
done
exit 0
