# Linux User Management System

## Overview
This Bash script provides a user-friendly command-line interface for managing Linux system users and groups. It allows system administrators to perform common tasks such as adding, deleting, and modifying users and groups with ease.

## Features
- **User Management:**
  - Add new users with a specified user ID and home directory.
  - Delete users with an option to remove their home directory.
  - List all registered system users.
  - Reset user passwords securely.
  - Check if a user exists.
- **Group Management:**
  - Create new groups.
  - Add users to groups.
  - List all system groups.
  - Delete groups.
- **Interactive Menu:**
  - Provides a simple text-based menu for ease of use.

## Prerequisites
- Linux-based operating system.
- `sudo` privileges to manage users and groups.

## Installation
Clone the repository and navigate to the project directory:
```sh
git clone <your-repo-link>
cd <repo-directory>
```

Make the script executable:
```sh
chmod +x user_manager.sh
```

## Usage
Run the script with:
```sh
./user_manager.sh
```
Follow the interactive menu to manage users and groups.

## Script Functions
### User Management
- `add_user()`: Adds a new user to the system.
- `delete_user()`: Deletes a user and optionally removes their home directory.
- `list_users()`: Displays a list of all registered users.
- `reset_password()`: Resets the password for a specified user.
- `check_user()`: Checks if a user exists on the system.

### Group Management
- `add_group()`: Creates a new group.
- `add_user_to_group()`: Adds a user to an existing group.
- `list_groups()`: Lists all available groups.
- `delete_group()`: Deletes a specified group.

## Example Usage
```
Choose from the following options:
A -> Add User
G -> Add Group
B -> Add User to Group
D -> Delete User
H -> List Groups
F -> Delete Group
L -> List Users
R -> Reset User's Password
C -> Check if User Exists
E -> Exit
```

