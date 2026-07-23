# 🗂️ Home-sorter

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

**Home-sorter** is an interactive, lightweight, and multilingual Shell Script (Bash) designed to clean up your `Downloads` directory by organizing loose files into their respective standard Linux `HOME` folders.

---

## ✨ Key Features

- **Automated File Sorting:** Automatically sweeps your `Downloads` directory and categorizes files into Documents, Pictures, Music, and Videos.
- **Multilingual Support (i18n):** Automatically checks your system environment variable (`$LANG`) to present native UI text in **Portuguese (PT-BR)** or **English (EN)**.
- **Dynamic System Paths:** Integrates with `xdg-user-dir` to locate system directories dynamically, regardless of your system language setup.
- **Safe Directory Handling:** Uses `mkdir -p` to prevent runtime crashes if target directories don't exist yet.
- **Rollback System:** Includes an interactive prompt allowing users to undo all file movements instantly in a single session.

---

## 📊 File Mapping & Supported Extensions

The script identifies file types based on standard extensions and routes them accordingly:

| Category | Target Directory | Supported Extensions |
| :--- | :--- | :--- |
| **Documents** | `~/Documents` / `~/Documentos` | `.pdf` |
| **Pictures** | `~/Pictures` / `~/Imagens` | `.jpg`, `.jpeg`, `.png` |
| **Music** | `~/Music` / `~/Músicas` | `.mp3`, `.ogg`, `.aac`, `.flac` |
| **Videos** | `~/Videos` / `~/Vídeos` | `.mp4` |

---

## 🖥️ Terminal Demo / Output Example

```text
Olá, pinky!
Este script organiza os arquivos do diretório Downloads nos diretórios respectivos do HOME.

Iniciar organização de pastas? (s/n): s

Iniciando organização de arquivos...
[✔] Documentos transferidos
[✔] Imagens transferidas
[✔] Músicas transferidas
[✔] Vídeos transferidos

Deseja reverter o processo? (s/n): n

[✔] Operação finalizada com sucesso.
```

---

## 🚀 Installation & Usage

### 1. Clone the repository
```bash
git clone [https://github.com/joaoluisbuessofilho/Home-sorter.git](https://github.com/joaoluisbuessofilho/Home-sorter.git)
cd Home-sorter
```

### 2. Make the script executable
```bash
chmod +x home-sorter.sh
```

### 3. Run the script
```bash
./home-sorter.sh
```

---

## 🛠️ Requirements & Compatibility

- **OS:** Linux / macOS / WSL (Windows Subsystem for Linux)
- **Shell:** Bash (v4.0 or higher recommended)
- **Utilities:** `xdg-user-dirs` (pre-installed on most modern Linux Desktop environments)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/joaoluisbuessofilho/Home-sorter/issues) if you want to add support for more file extensions (e.g., `.zip`, `.tar.gz`, `.docx`).

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).
