#!/bin/bash

##
# Copyright 2022 Siemens DISW
# SPDX-License-Identifier: Apache-2.0

#####################################################################
# Sensor:         DISW in use rpms
# Author:         James Bagley
# Description:    get a list of used packages based on open files (lsof)
#
# Input:          None
# Version:        1
# Version Date:   2020
#####################################################################


logfile="/root/in_use_rpms.txt"

packages=()
if command -v lsof > /dev/null
then
    while read file
    do
        packages+=($(rpm -qf $file --qf "%{NAME}.%{ARCH}\n" | grep -v "is not owned by any package"))
    done< <(lsof -X -c ^automount -c ^kworker -Fn / | grep ^n/ | cut -c2- | sort -u)
    printf '%s\n' "${packages[@]}" | sort -u > $logfile
fi
