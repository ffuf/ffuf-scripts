#!/bin/sh

##############################################################################
# Script name: ffuf_basicauth.sh
# Description: Generate HTTP basic authentication username:password
#              credential combinations from provided wordlists.
# Author:      Joona Hoikkala
# Email:       joohoi@io.fi
############################################################################## 
# 
# Usage example:
# Test each HTTP basic authentication username:password combination 
# in https://example.org/endpoint, and filter out 403 - Forbidden responses.
# 
# ./ffuf_basicauth.sh usernames.txt passwords.txt |ffuf -w -:AUTH \
#    -u https://example.org/endpoint -H "Authorization: Basic AUTH" -fc 403
#
##############################################################################

if [ "$#" -ne 2 ]; then
    printf "Usage: %s usernames.txt passwords.txt\n" "$0" >&2
    exit 1
fi

if ! [ -f "$1" ]; then
    printf "%s file not found.\n\n" "$1" >&2
    printf "Usage: %s usernames.txt passwords.txt\n" "$0" >&2
    exit 1
fi

if ! [ -f "$2" ]; then
    printf "%s file not found.\n\n" "$2" >&2
    printf "Usage: %s usernames.txt passwords.txt\n" "$0" >&2
    exit 1
fi

USERNAME_WORDLIST="$1"
PASSWORD_WORDLIST="$2"

awk 'NR==FNR{user[NR]=$0; next} {for (i=1;i<=length(user);i++) {printf "%s:%s\n", user[i], $0}}' "$USERNAME_WORDLIST" "$PASSWORD_WORDLIST"
