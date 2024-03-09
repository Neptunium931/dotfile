#!/bin/bash


for i in "$@"; do
    hex_number=$i
    dec_number=$(printf "%d" "0x$hex_number")
    echo "$hex_number $dec_number"
done
