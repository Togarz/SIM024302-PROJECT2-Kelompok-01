#!/usr/bin/env bash

validate_target() {
    local target="$1"
    local input_base

    if [[ ! -d "$target" ]]; then
        log_message ERROR "Direktori target tidak ditemukan: $target"
        return 2
    fi

    VALIDATED_TARGET="$(realpath -e -- "$target")"
    input_base="$(realpath -e -- "$ROOT_DIR/data/input")"

    case "$VALIDATED_TARGET" in
        "$input_base"/*)
            log_message INFO "Target berhasil divalidasi."
            return 0
            ;;
        *)
            log_message ERROR "Target berada di luar direktori yang diizinkan."
            return 4
            ;;
    esac
}

validate_archive_name() {
    local name="$1"

    if [[ ! "$name" =~ ^[A-Za-z0-9][A-Za-z0-9._-]*\.tar\.gz$ ]]; then
        log_message ERROR "Nama arsip tidak valid."
        return 1
    fi

    return 0
}
