#!/bin/sh

function notifyit(){
zenity --notification --text="$1"
}
function warningframe(){
 zenity --warning --text="$1 is a wrong input please try again"
}

function removingtodo(){

hel=$(cat -n ./todo.txt)
echo $hel  
gam=$(zenity --entry \
 --title="remove todo" \
 --text="$hel" )
removedtext=$(sed -n "$gam p" todo.txt) 
sed -i "$gam d" todo.txt
notifyit " Removed todo : $removedtext "

}

function addingtodo(){

npc=$(zenity --entry \
--title="Adding Todo" \
--text="Enter new todo" ) 
echo "$npc" >> todo.txt
notifyit "Todo added : $npc" 

}

function mainscreen(){

while true

do 

#main screen 
abc=$(zenity --entry \
--title="todos" \
--text="enter 1 to add todo 
 enter 2 to view todo 
 enter 3 to remove todo
 enter exit to close ")

#condition
case $abc in

1)
addingtodo;;

2)
cat -n ./todo.txt | zenity --text-info --title="view todo" ;;

3)
 removingtodo;;

"exit")
break;;

*)
 warningframe "$abc" ;;
esac

done
}

mainscreen
