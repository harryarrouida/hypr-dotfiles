# My Dotfiles

This repository contains my personal dotfiles for a minimal Arch Linux setup with Hyprland.

The dotfiles are managed using a **bare Git repository**, which is the recommended method for keeping your configuration files in version control without a visible `.git` folder in your home directory.

## Installation

### Prerequisites

You need a basic Arch Linux installation with the following packages installed:

* **Git**
* **Zsh**
* **Hyprland** and **Hyprpaper**
* **Kitty** (Terminal Emulator)
* **Waybar** (Status Bar)
* **Rofi** (Application Launcher)
* **Pywal** (Color Scheme Generator)
* **Fastfetch** (System Information)
* **Hyprlock** (Screen Locker)
* **Xclip** (Clipboard Utility)
* **Bluez** and **Bluetuith** (Bluetooth)

Most of these are available in the official repositories or the AUR. For AUR packages, `yay` is recommended.

### Setup on a New Machine

1.  **Clone the bare repository:**
    This will clone the repository into a hidden `.dotfiles` folder.
    ```bash
    git clone --bare git@github.com:your_username/dotfiles.git $HOME/.dotfiles
    ```

2.  **Create the alias:**
    Add this alias to your `.zshrc` file for easy management.
    ```bash
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```
    Then, source your `.zshrc` file: `source ~/.zshrc`

3.  **Back up existing dotfiles:**
    Before checking out the files, back up any existing dotfiles to avoid conflicts.
    ```bash
    mkdir -p .dotfiles-backup && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
    ```

4.  **Checkout the files:**
    This command will copy the files from the repository to your home directory.
    ```bash
    dotfiles checkout
    ```

5.  **Hide untracked files:**
    This prevents `git status` from showing all the files in your home directory.
    ```bash
    dotfiles config --local status.showUntrackedFiles no
    ```

## Usage

* **Add new files:** To add a new file or folder to the repository, use the `dotfiles` alias.
    ```bash
    dotfiles add .config/new_app
    dotfiles commit -m "Add new app config"
    dotfiles push
    ```

* **Pull updates:** To pull changes from the remote repository, use:
    ```bash
    dotfiles pull
    ```
