#!/bin/sh
echo "Les utilisateurs dont les UID sont supérieurs à 1000 sont: "
nbr=0
tab_users=()

#Je recupere les uid des utilisateur ici 
for i in $(cat /etc/passwd | cut -d ":" -f 3) ;                                  
do  
    #Je vérifie si l'uid est superieur à 1000
    if test $i -gt 1000;then                                                                            
     #Je recupere le nom de l'utilisateur dans la variable m ici                                               
     id $i | sed -e "s/ name groupes/\n\tgroupes/" | grep "uid" | cut -d " " -f 1 > /tmp/user_name.txt
     m=$(cat /tmp/user_name.txt)
     m=${m##*(}
     m=${m%%)*}
     tab_users[nbr]=$i
     #J'affiche la liste des utilisateurs ici
     nbr=$((nbr+1)) 
     echo "N°$nbr Nom utilisateur:\"$m\" uid:\"$i\""
    fi  
done
exit 0
