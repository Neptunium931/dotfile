#!/bin/bash

ps -ely | awk '$13 == "zsh"' | awk '{SUM += $8/1224} END {print SUM}' | cut -d '.' -f1
