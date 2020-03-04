#!/bin/bash

system_profiler SPHardwareDataType | sed -e '1,4d' | sed 's/^[ \t]*//g' | sed '/^$/d'
echo "Board-ID:"$(ioreg -c IOPlatformExpertDevice | awk '/board-id/ {print $4}' | awk -F '\"' '{print $2}') | sed '/^$/d'
echo "DRM仿冒ID(shiki):"$(ioreg -c IOPlatformExpertDevice | awk '/hwdrm-id/ {print $4}' | awk -F '\"' '{print $2}') | sed '/^$/d'
echo "核显ig-platform-id:"$(ioreg -c IOPCIDevice | awk '/AAPL,ig-platform-id/ {print $7}' | awk -F '\<' '{print $2}' | awk -F '\>' '{print $1}') | sed '/^$/d'
system_profiler SPSoftwareDataType | sed -e '1,4d' | sed 's/^[ \t]*//g' | sed '/^$/d' | sed -e '$d'
