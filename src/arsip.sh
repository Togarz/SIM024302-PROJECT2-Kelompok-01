#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

LOG_FILE="$ROOT_DIR/logs/arsip.log"
BACKUP_DIR="$ROOT_DIR/data/backup"

source "$SCRIPT_DIR/modules/log.sh"
source "$SCRIPT_DIR/modules/validate.sh"
source "$SCRIPT_DIR/modules/archive.sh"

if [[ $# -ne 2 ]]; then
    log_message ERROR "Penggunaan: bash src/arsip.sh <direktori-target> <nama-arsip.tar.gz>"
    exit 1
fi

TARGET="$1"
ARCHIVE_NAME="$2"

validate_archive_name "$ARCHIVE_NAME"
status=$?

if (( status != 0 )); then
    exit "$status"
fi

validate_target "$TARGET"
status=$?

if (( status != 0 )); then
    exit "$status"
fi

create_archive "$VALIDATED_TARGET" "$ARCHIVE_NAME"
status=$?

exit "$status"
