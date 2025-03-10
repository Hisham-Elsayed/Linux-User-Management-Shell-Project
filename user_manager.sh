#!/bin/bash

#Function for adding new users
add_user()
{
	#Assignm username
	echo "Please enter username you want to add"
	read username

	#check if username entered already exists
	if id "$username" &>/dev/null; then
               echo "Username '$username' exists..Failed To create username '$username' "
	else
	#Assign user id
	echo "Please enter user id"
	read userid

	sudo useradd -u "$userid" -m -d "/home/$username" -s /bin/bash "$username"
 
	#Assign user password
	echo "Do you want user to have password ?"

	read option

        if [[ "$option" == "y" || "$option" == "Y" ]]; then
                sudo passwd "$username"
        elif [[ "$option" == "n" || "$option" == "N" ]]; then
                echo "User is created successfully without password"
        else
        echo "Invalid Option"
        fi
fi 
}

#Function for deleting existing users
delete_user()
{
	echo "Please enter username of the user you want to delete"
	read username

	#Option: Delete the user's home directory
	echo "Do you want to also delete the user's home directory: y/Y for Yes, n/N for No"
	read option

	if [[ "$option" == "y" || "$option" == "Y" ]]; then
		sudo userdel -r "$username"		#delete also the home directory	
	elif [[ "$option" == "n" || "$option" == "N" ]]; then
		sudo userdel "$username"
		echo "User is deleted successfully but home directory is kept"
	else
	echo "Invalid Option"
	fi
}

#Function for listing system Users
list_users()
{
	echo "Listing all registered users:"
	cut -d: -f1 /etc/passwd		#extract only the username field
}

#Function for resetting passwords
reset_password()
{
	echo "Please enter username to reset the password:"
	read username

	if id "$username" &>/dev/null; then		#check if user exists
    		sudo passwd "$username"
	else
    		echo "Username '$username' does not exist"
fi

}

#Function for checking if a user exists
check_user()
{
		echo "Please enter username:"
		read username
	        if id "$username" &>/dev/null; then             #check if user exists
               		echo "Username '$username' exists"
       		else
                	echo "Username '$username'  does not exist"
fi
}

#** Functions for managing user groups **

add_group() {
    echo "Enter group name:"
    read groupname
    sudo groupadd "$groupname"
}

add_user_to_group() {
    echo "Enter username:"
    read  username
    echo "Enter group name:"
    read  groupname
    sudo usermod -aG "$groupname" "$username"
}

list_groups()
{
	echo "Listing Groups"
	cut -d: -f1 /etc/group
}

delete_group()
{
	echo "Please enter group name you want to delete"
	read groupname
	sudo groupdel "$groupname"
}

# ************************************************************ Main Menu ***************************************************************

while true; do
        echo "Choose from the following options"
        echo "A -> Add User, G -> Add Group, B -> Add User to Group, D -> Delete User, H -> List Groups, F -> Delete Group  L -> List Users, R -> Reset User's Password, C -> Check User exists or not, E -> Exit:"
        read cmd
        if [ "$cmd" == "A" ]; then 
        add_user
        elif [ "$cmd" == "D" ]; then
        delete_user
        elif [ "$cmd" == "L" ]; then
        list_users
        elif [ "$cmd" == "R" ]; then
        reset_password
	elif [ "$cmd" == "C" ]; then
        check_user
	elif [ "$cmd" == "G" ]; then
        add_group
	elif [ "$cmd" == "B" ]; then
        add_user_to_group
	elif [ "$cmd" == "H" ]; then
        list_groups
	elif [ "$cmd" == "F" ]; then
        delete_group
        elif [ "$cmd" == "E" ]; then
        exit
        else
        echo "Invalid Option" 
        fi
        done
