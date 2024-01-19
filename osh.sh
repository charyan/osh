#! /bin/bash

if [[ -z $(pidof ollama) ]]; then
    ollama serve &>/dev/null &
    disown
fi

/usr/bin/env python3 osh.py $@
