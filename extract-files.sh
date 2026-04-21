#!/bin/bash
#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=serenity
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [[ ! -f "${HELPER}" ]]; then
    echo "Mistake: extract_utils.sh not found at ${HELPER}"
    exit 1
fi

# Source the helper to make functions like setup_vendor available
source "${HELPER}"

# Default to generating makefiles
SETUP_MAKEFILES=true

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --no-makefile )
                SETUP_MAKEFILES=false
                ;;
        -s | --section )
                SECTION="${2}"; shift
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [[ -z "${SRC}" ]]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${SECTION}"

if [ "${SETUP_MAKEFILES}" = true ]; then
    # Finish the vendor makefile creation
    "${MY_DIR}/setup-makefiles.sh"
fi
