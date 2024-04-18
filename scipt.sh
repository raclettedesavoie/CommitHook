#!/bin/bash

# Lien vers le fichier commit-msg
url="https://raw.githubusercontent.com/raclettedesavoie/CommitHook/main/commit-msg"

# Télécharge le fichier commit-msg
curl -k -o ./commit-msg-test "$url"

# Vérifie si le téléchargement a réussi
if [ $? -eq 0 ]; then
    echo "Le fichier commit-msg a été téléchargé avec succès."
    
    # Configure le chemin des hooks Git globaux
    git config --global core.hooksPath "$(pwd)"
    if [ $? -eq 0 ]; then
        echo "Le chemin des hooks Git globaux a été configuré avec succès."
    else
        echo "Erreur lors de la configuration du chemin des hooks Git globaux."
        exit 1
    fi
else
    echo "Erreur lors du téléchargement du fichier commit-msg."
    exit 1
fi

exit 0