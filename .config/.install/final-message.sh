#!/bin/bash

# Post-install message
clear
echo "-------------------------- INSTALLATION FINISHED -------------------------"
echo "Please reboot your system."
echo ""
echo "Generic post-install reminder:"
echo " 1. Add myself to /etc/sudoers:"
echo "    twilight ALL=(ALL:ALL) NOPASSWD: ALL"
echo "    Defaults !tty_tickets"
echo " 2. Check post-install: https://github.com/Twilight4/debian-setup"
#echo "3. Install appropriate kernel headers (if not installed):"
#echo "    apt search linux-headers-\$(uname -r)"
echo " 3. Import your OpenAI API key for emacs in ~/.authinfo:"
echo '    machine api.openai.com login apikey password <TOKEN_HERE>'
echo ' 4. Copy AI prompts to emacs dir to source them:'
echo '    cp ~/desktop/workspace/dotfiles/.config/ai-prompts ~/.cache/emacs'
echo " 5. Add pub key to github:"
echo '    ssh-keygen -t ed25519'
echo " 6. Clone relevant repos via SSH:"
echo '    git clone git@github.com:Twilight4/dotfiles.git ~/desktop/workspace/dotfiles'
echo '    git clone git@github.com:Twilight4/nobility.git ~/desktop/workspace/nobility'
echo '    git clone git@github.com:Twilight4/debian-setup.git ~/desktop/workspace/debian-setup'
echo '    git clone git@github.com:Twilight4/org.git ~/documents/org'
echo '    git clone git@github.com:Twilight4/cheats.git ~/.config/cheat'
echo " 7. Sync files with the cloud: backup.sh"
echo ""

# Prompt the user to reboot
read -p "Do you want to reboot the system now? (y/n): " reboot_response

if [[ "$reboot_response" == "y" ]]; then
    echo "Rebooting the system..."
    sudo reboot
else
    echo "Reboot cancelled. Please reboot manually if needed."
fi
