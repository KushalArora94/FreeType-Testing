#!/bin/bash
set -euxo pipefail

# Copyright 2018 by
# Armin Hasitzka.
#
# This file is part of the FreeType project, and may only be used, modified,
# and distributed under the terms of the FreeType project license,
# LICENSE.TXT.  By continuing to use, modify, or distribute this file you
# indicate that you have read the license and understand and accept it
# fully.

dir="${PWD}"
cd "${0%/*}" # go to `fuzzing/scripts'

bin_base_dir=$(readlink -f "../build/bin")
corpora_base_dir=$(readlink -f "../corpora")

fuzzers=(
    "legacy"
    "cff"
    "cidtype1"
    "truetype"
)

# This script relies on:
#   - `$OUT':  directory to store build artifacts
#   - `$WORK': directory for storing intermediate files

for fuzzer in "${fuzzers[@]}"; do

    cp "${bin_base_dir}/${fuzzer}" "${OUT}/${fuzzer}"

    seed_dir="${WORK}/${fuzzer}_seed_corpus"
    seed_zip="${OUT}/${fuzzer}_seed_corpus.zip"
    options_file="${OUT}/${fuzzer}.options"

    mkdir -p "${seed_dir}"

    find "${corpora_base_dir}/${fuzzer}" \
         -type f \
         ! -name "README.md" \
         -exec cp {} "${seed_dir}" \;

    zip -j "${seed_zip}" "${seed_dir}/"*

    cat >"${options_file}" <<EOF
[libfuzzer]
max_len = 30000
EOF

done

cd "${dir}"
