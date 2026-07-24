# 🗂️ Home-sorter

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

**Home-sorter** is an interactive, lightweight, and multilingual Shell Script (Bash) designed to clean up your `Downloads` directory by organizing loose files into their respective standard Linux `HOME` folders.

---

## ✨ Key Features

- **Automated File Sorting:** Automatically sweeps your `Downloads` directory and categorizes files into Documents, Pictures, Music, and Videos using array-defined extension lists.
- **Multilingual Support (i18n):** Automatically checks your system environment variable (`$LANG`) to present native UI text in **Portuguese (PT-BR)** or **English (EN)**.
- **Dynamic System Paths:** Integrates with `xdg-user-dir` to locate system directories dynamically, regardless of your system language setup.
- **Safe Directory Handling:** Uses `mkdir -p` to prevent runtime crashes if target directories don't exist yet.
- **Session-Based Rollback System:** Logs exact file migrations (`origin::destination`) in memory during execution to guarantee precise restoration if you decide to revert the changes.

---

## 📊 File Mapping & Supported Extensions

The script identifies file types based on standard extensions and routes them accordingly:

| Category | Target Directory | Supported Extensions |
| :--- | :--- | :--- |
| **Documents** | `~/Documents` / `~/Documentos` | `.pdf`, `.docx`, `.doc`, `.txt`, `.odt`, `.xlsx`, `.xls`, `.csv`, `.pptx`, `.ppt`, `.epub`, `.rtf`, `.md` |
| **Pictures** | `~/Pictures` / `~/Imagens` | `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`, `.svg`, `.bmp`, `.tiff`, `.heic` |
| **Music** | `~/Music` / `~/Músicas` | `.mp3`, `.flac`, `.ogg`, `.wav`, `.m4a`, `.aac`, `.wma` |
| **Videos** | `~/Videos` / `~/Vídeos` | `.mp4`, `.mkv`, `.webm`, `.avi`, `.mov`, `.flv` |

---

## 🖥️ Terminal Demo / Output Example

```text
Hello, pinky
This script organizes files from the Downloads directory.
Start folder organization? (y/n): y

Starting file organization...
→ document.pdf
→ spreadsheet.xlsx
[✔] Documents transferred
→ photo.png
[✔] Images transferred
[✔] Music transferred
→ video.mp4
[✔] Videos transferred

Do you want to revert the process? (y/n): n

[✔] Operation completed successfully.
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

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/joaoluisbuessofilho/Home-sorter/issues) if you want to add support for more file extensions (e.g., `.zip`, `.tar.gz`, `.iso`, `.deb`).

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).
