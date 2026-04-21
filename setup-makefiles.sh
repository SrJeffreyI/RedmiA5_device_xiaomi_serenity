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

# Source the helper
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" true

# Warning headers and guards - Passing DEVICE to fix the error
write_headers "${DEVICE}"

write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish the vendor makefile creation
write_footers
