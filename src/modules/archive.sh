#!/usr/bin/env bash

create_archive() {
    local target="$1"
    local archive_name="$2"
    local archive_path="$BACKUP_DIR/$archive_name"

    if [[ -e "$archive_path" ]]; then
        log_message ERROR "Arsip sudah tersedia: $archive_name"
        return 3
    fi

    log_message INFO "Memulai proses backup."

    if tar -czf "$archive_path" -C "$target" .; then
        log_message INFO "Backup berhasil: $archive_name"
        return 0
    else
        rm -f -- "$archive_path"
        log_message ERROR "Proses backup gagal."
        return 3
    fi
}
