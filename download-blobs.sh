#!/bin/bash

# Copyright (C) 2012 JCROM Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

EXTRACT_RC="$PWD/extract.rc"

install_blobs() {
    mkdir -p download-$1 &&
    (cd download-$1 && shasum -p -c $3) ||
    for BLOB in $2 ; do
        rm -f download-$1/$BLOB &&
        curl https://dl.google.com/dl/android/aosp/$BLOB -o download-$1/$BLOB ||
        exit -1
    done &&
    (cd download-$1 && shasum -p -c $3) &&
    for BLOB in $2 ; do
        tar xvfz download-$1/$BLOB -C download-$1 ||
        exit -1
    done &&
    for BLOB_SH in download-$1/extract-*.sh ; do
        BASH_ENV="$EXTRACT_RC" bash $BLOB_SH
    done
}

MAGURO_BLOBS="broadcom-maguro-jdq39-8edbeae8.tgz
              imgtec-maguro-jdq39-bb3c4e4e.tgz
              invensense-maguro-jdq39-5eeb2d51.tgz
              nxp-maguro-jdq39-a20a2cd1.tgz
              samsung-maguro-jdq39-556fc2c7.tgz
              widevine-maguro-jdq39-62276b32.tgz"

CSUM_LIST="$PWD/blob-shasums"

cd ../../.. &&
install_blobs galaxy-nexus "$MAGURO_BLOBS" "$CSUM_LIST"

