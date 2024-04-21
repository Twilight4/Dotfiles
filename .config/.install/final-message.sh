#!/bin/bash

# Post-install message
echo "DONE, Please logout and reboot your system."
echo "------------------------------ AFTER REBOOT ------------------------------"
echo "1. Check if profile sync daemon is running:"
echo '    psd p'
echo "2. Configure browser settings"
echo "3. Import the ~/.config/superProductivity/config.json in: Settings > Sync & Export > Import From File"
echo "4. Import your OpenAI API key for emacs in '~/.authinfo':"
echo '    machine api.openai.com login apikey password <TOKEN_HERE>'
echo '5. Copy ai prompts to emacs dir to source them:'
echo '    cp ~/desktop/workspace/dotfiles/.config/ai-prompts ~/.cache/emacs'
echo "6. Add pub key to github: Settings > SSH > New:"
echo '    ssh-keygen -t ed25519'
echo "7. Clone relevant repos via SSH:"
echo '    git clone --depth 1 git@github.com:Twilight4/dotfiles.git ~/desktop/workspace/dotfiles'
echo '    git clone --depth 1 git@github.com:Twilight4/org.git ~/documents/org'
echo '    git clone --depth 1 git@github.com:Twilight4/cheats.git ~/.config/cheat'
echo "8. Install more tools from arch-setup/tools-installation directory"
echo ""
