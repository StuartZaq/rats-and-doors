#!/bin/bash

# --- Конфигурация ---
VERSION="0.98"
COMMON_META="common.yaml"
VERSION_META="version.yaml"
PDF_ENGINE="xelatex"
BASE_NAME="Rats_and_Doors"

# --- Список файлов ---
FILES=("rules.md" "spells.md" "optionals.md" "referee.md" "castles.md")

# --- Цикл сборки ---
for MD_FILE in "${FILES[@]}"; do
    # Определяем имя PDF
    case "$MD_FILE" in
        "rules.md")
            OUT="${BASE_NAME}_ver.${VERSION}.pdf"
            ;;
        "spells.md")
            OUT="${BASE_NAME}_ver.${VERSION}_Spells.pdf"
            ;;
        "optionals.md")
            OUT="${BASE_NAME}_ver.${VERSION}_Optionals.pdf"
            ;;
        "referee.md")
            OUT="${BASE_NAME}_ver.${VERSION}_Referee.pdf"
            ;;
        "castles.md")
            OUT="${BASE_NAME}_ver.${VERSION}_Castles.pdf"
            ;;
        *)
            echo "Неизвестный файл: $MD_FILE"
            continue
            ;;
    esac

    echo "Собираем $MD_FILE → $OUT"

    pandoc "$MD_FILE" \
      --metadata-file="$COMMON_META" \
      --metadata-file="$VERSION_META" \
      --pdf-engine="$PDF_ENGINE" \
      -s -o "$OUT"
done
