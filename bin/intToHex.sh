#!/bin/bash


for i in "$@"; do
    dec_number=$i
    hex_number=$(printf "%x" "$dec_number")
    echo "$dec_number $hex_number"
done
