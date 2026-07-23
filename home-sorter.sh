#!/bin/bash
#Internationalization and System Detection
if [[ "$LANG" =~ ^pt ]]; then
    #Portuguese Strings
    MSG_WELCOME="Olá, $USER"
    MSG_DESC="Este script organiza os arquivos do diretório Downloads."
    MSG_PROMPT="Iniciar organização de pastas? (s/n): "
    MSG_START="Iniciando organização..."
    MSG_DOCS="[✔] Documentos transferidos"
    MSG_PICS="[✔] Imagens transferidas"
    MSG_MUS="[✔] Músicas transferidas"
    MSG_VIDS="[✔] Vídeos transferidos"
    MSG_REVERT_PROMPT="Deseja reverter o processo? (s/n): "
    MSG_REVERT_START="Iniciando reversão..."
    MSG_REVERT_DONE="[↺] Reversão feita com sucesso."
    MSG_SUCCESS="[✔] Operação finalizada com sucesso."
    MSG_CANCEL="[✘] Operação cancelada pelo usuário."
    CONFIRM_CHAR="s"
else
    #English Strings
    MSG_WELCOME="Hello, $USER"
    MSG_DESC="This script organizes files from the Downloads directory."
    MSG_PROMPT="Start folder organization? (y/n): "
    MSG_START="Starting file organization..."
    MSG_DOCS="[✔] Documents transferred"
    MSG_PICS="[✔] Images transferred"
    MSG_MUS="[✔] Music transferred"
    MSG_VIDS="[✔] Videos transferred"
    MSG_REVERT_PROMPT="Do you want to revert the process? (y/n): "
    MSG_REVERT_START="Starting reversion..."
    MSG_REVERT_DONE="[↺] Reversion completed successfully."
    MSG_SUCCESS="[✔] Operation completed successfully."
    MSG_CANCEL="[✘] Operation canceled by user."
    CONFIRM_CHAR="y"
fi
#Dynamically find user directories using xdg-user-dir (Fallback to $HOME if missing)
DIR_DOWNLOADS=$(xdg-user-dir DOWNLOAD 2>/dev/null || echo "$HOME/Downloads")
DIR_DOCS=$(xdg-user-dir DOCUMENTS 2>/dev/null || echo "$HOME/Documents")
DIR_PICS=$(xdg-user-dir PICTURES 2>/dev/null || echo "$HOME/Pictures")
DIR_MUSIC=$(xdg-user-dir MUSIC 2>/dev/null || echo "$HOME/Music")
DIR_VIDEOS=$(xdg-user-dir VIDEOS 2>/dev/null || echo "$HOME/Videos")

#User Greetings
echo "$MSG_WELCOME"
sleep 1
echo "$MSG_DESC"
sleep 1
read -r -p "$MSG_PROMPT" RESPONSE
echo ""

#Validate Input (converts input to lowercase)
if [[ "${RESPONSE,,}" == "$CONFIRM_CHAR" || "${RESPONSE,,}" == "s" || "${RESPONSE,,}" == "y" ]]; then
    echo "$MSG_START"
    
    #Ensure directories exist
    mkdir -p "$DIR_DOCS" "$DIR_PICS" "$DIR_MUSIC" "$DIR_VIDEOS"

    #Move Documents
    mv "$DIR_DOWNLOADS"/*.pdf "$DIR_DOCS/" 2>/dev/null
    echo "$MSG_DOCS"
    sleep 1

    #Move Pictures
    mv "$DIR_DOWNLOADS"/*.jpg "$DIR_DOWNLOADS"/*.png "$DIR_PICS/" 2>/dev/null
    echo "$MSG_PICS"
    sleep 1

    #Move Musics
    mv "$DIR_DOWNLOADS"/*.mp3 "$DIR_DOWNLOADS"/*.flac "$DIR_MUSIC/" 2>/dev/null
    echo "$MSG_MUS"
    sleep 1
    
    #Move Videos
    mv "$DIR_DOWNLOADS"/*.mp4 "$DIR_VIDEOS/" 2>/dev/null
    echo "$MSG_VIDS"
    sleep 1

    #Rollback prompt
    read -r -p "$MSG_REVERT_PROMPT" RESPONSEREVERT
    echo ""

    if [[ "${RESPONSEREVERT,,}" == "$CONFIRM_CHAR" || "${RESPONSEREVERT,,}" == "s" || "${RESPONSEREVERT,,}" == "y" ]]; then
        echo "$MSG_REVERT_START"
        
        mv "$DIR_DOCS"/*.pdf "$DIR_DOWNLOADS/" 2>/dev/null
        mv "$DIR_PICS"/*.jpg "$DIR_PICS"/*.png "$DIR_DOWNLOADS/" 2>/dev/null
        mv "$DIR_MUSIC"/*.mp3 "$DIR_MUSIC"/*.flac "$DIR_DOWNLOADS/" 2>/dev/null
        mv "$DIR_VIDEOS"/*.mp4 "$DIR_DOWNLOADS/" 2>/dev/null
        
        echo "$MSG_REVERT_DONE"
    else
        echo "$MSG_SUCCESS"
    fi    
else
    echo "$MSG_CANCEL"
    sleep 1
fi
