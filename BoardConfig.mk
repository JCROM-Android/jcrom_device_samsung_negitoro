# Copyright (C) 2011 The Android Open Source Project
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

# Default values, possibly overridden by BoardConfigVendor.mk
TARGET_BOARD_INFO_FILE := device/samsung/negitoro/board-info.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/negitoro/bluetooth

# Use the non-open-source part, if present
-include vendor/samsung/negitoro/BoardConfigVendor.mk

# Use the part that is common between all tunas
include device/samsung/tuna/BoardConfig.mk

