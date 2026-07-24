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

EXT_DOCS=(pdf docx doc txt odt xlsx xls csv pptx ppt epub rtf md)
EXT_PICS=(jpg jpeg png gif webp svg bmp tiff heic)
EXT_MUSIC=(mp3 flac ogg wav m4a aac wma)
EXT_VIDEOS=(mp4 mkv webm avi mov flv)

# Registry array that stores every file moving 
declare -a MOVED_LOG=()

#User Greetings
echo "$MSG_WELCOME"
sleep 1
echo "$MSG_DESC"
sleep 1
read -r -p "$MSG_PROMPT" RESPONSE
echo ""

if [[ "${RESPONSE,,}" == "$CONFIRM_CHAR" || "${RESPONSE,,}" == "s" || "${RESPONSE,,}" == "y" ]]; then
    echo "$MSG_START"
    mkdir -p "$DIR_DOCS" "$DIR_PICS" "$DIR_MUSIC" "$DIR_VIDEOS"

    #Move Documents
    for ext in "${EXT_DOCS[@]}"; do
        for file in "$DIR_DOWNLOADS"/*."$ext"; do
            [[ -e "$file" ]] || continue
            echo "→ $(basename "$file")"
            mv "$file" "$DIR_DOCS/" 2>/dev/null
            MOVED_LOG+=("${file}::${DIR_DOCS}/$(basename "$file")")
        done
    done
    echo "$MSG_DOCS"

    #Move Pictures
    for ext in "${EXT_PICS[@]}"; do
        for file in "$DIR_DOWNLOADS"/*."$ext"; do
            [[ -e "$file" ]] || continue
            echo "→ $(basename "$file")"
            mv "$file" "$DIR_PICS/" 2>/dev/null
            MOVED_LOG+=("${file}::${DIR_PICS}/$(basename "$file")")
        done
    done
    echo "$MSG_PICS"

    #Move Musics
    for ext in "${EXT_MUSIC[@]}"; do
        for file in "$DIR_DOWNLOADS"/*."$ext"; do
            [[ -e "$file" ]] || continue
            echo "→ $(basename "$file")"
            mv "$file" "$DIR_MUSIC/" 2>/dev/null
            MOVED_LOG+=("${file}::${DIR_MUSIC}/$(basename "$file")")
        done
    done
    echo "$MSG_MUS"

    #Move Videos
    for ext in "${EXT_VIDEOS[@]}"; do
        for file in "$DIR_DOWNLOADS"/*."$ext"; do
            [[ -e "$file" ]] || continue
            echo "→ $(basename "$file")"
            mv "$file" "$DIR_VIDEOS/" 2>/dev/null
            MOVED_LOG+=("${file}::${DIR_VIDEOS}/$(basename "$file")")
        done
    done
    echo "$MSG_VIDS"

    #Rollback prompt
    read -r -p "$MSG_REVERT_PROMPT" RESPONSEREVERT
    echo ""

    if [[ "${RESPONSEREVERT,,}" == "$CONFIRM_CHAR" || "${RESPONSEREVERT,,}" == "s" || "${RESPONSEREVERT,,}" == "y" ]]; then
        echo "$MSG_REVERT_START"

        for entry in "${MOVED_LOG[@]}"; do
            original="${entry%%::*}"
            current="${entry##*::}"

            if [[ -e "$current" ]]; then
                mv "$current" "$original" 2>/dev/null
                echo "↺ $(basename "$current")"
            fi
        done

        echo "$MSG_REVERT_DONE"
    else
        echo "$MSG_SUCCESS"
    fi
else
    echo "$MSG_CANCEL"
    sleep 1
fi
