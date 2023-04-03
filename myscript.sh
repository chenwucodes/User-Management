#!/bin/bash
# Filename: myscript.sh
# Author: Chen Wu
# Date: March 17 2023
# Objective:
# This script provides a menu for managing user accounts
# It allows users to create, delete, modify and manage user accounts


# Display the menu

  clear

  display_menu(){
	  echo " User Account Management "
	  echo " ----------------------- "
	  echo "A. Create User Account"
	  echo "B. Delete User Account"
	  echo "C. Change Spplementary Group for a User Account"
	  echo "D. Change Initial Group for a User Account"
	  echo "E. Change default login shell for a User Account"
	  echo "F. Change account expiration date for a User Account"
	  echo "Q. Quit"
	  echo ""
	  echo -n "Select an option (A-F or Q)" 
  }

# Create user account
  create_user(){
	  read -p "Enter username: " username
	  read -p "Enter home directory: " home_dir
	  read -p "Enter default login shell: " login_shell
	  useradd -m -d $home_dir -s $login_shell $username
	  echo "User $username created."
	  sleep 3
  }

# Delete user account
  delete_user(){
	  read -p "Enter username to delete: " username
	  userdel -r $username
	  echo "User $username deleted."
	  sleep 3
  }

# Change supplementary group for user account
  change_supplementary_group(){
	  read -p "Enter username: " username
	  read -p "Enter group name: " groupname
	  usermod -aG $groupname $username
	  echo "Group $groupname added as a supplementary group for user $username."
	  sleep 3
  }

# Change initial group for user account
  change_initial_group(){
	  read -p "Enter username: " username
	  read -p "Enter group name: " groupname
	  usermod -g $groupname $username
	  echo "Initial group for user $username changed to $groupname."
	  sleep 3
  }

# Change defaulr login shell for user account
  change_default_shell(){
	  read -p "Enter username: " username
	  read -p "Enter shell name: " shellname
	  chsh -s $shellname $username
	  echo "Default login shell for user $username changed to $shellname."
	  sleep 3
  }

# Change account expiration date for user account
  change_account_expiry(){
	  read -p "Enter username: " username
	  read -p "Enter expiration date (YYYY-MM-DD): " expirydate
	  usermod -e $expirydate $username
	  echo "Accound expiration date for $username changed to $expirydate."
	  sleep 3
  }

# Initialize choice to a dummy value
  choice=n

  while [ $choice != "Q" ] && [ $choice != "q" ]
  do
  display_menu
  read choice

  if [ $choice = "A" ] || [ $choice = "a" ]
     then
     create_user
  elif [ $choice = "B" ] || [ $choice = "b" ]
     then
     delete_user
  elif [ $choice = "C" ] || [ $choice = "c" ]
     then
     change_supplementary_group
  elif [ $choice = "D" ] || [ $choice = "d" ]
     then
     change_initial_group
  elif [ $choice = "E" ] || [ $choice = "e" ]
     then
     change_default_shell
  elif [ $choice = "F" ] || [ $choice = "f" ]
     then
     change_account_expiry
  elif [ $choice != "Q" ] && [ $choice != "q" ]
     then
     echo "Valid options are A, B, C, D, E, F or [Q]uit"
     sleep 3
  fi

  done


# eof: myscript.sh  

