#!/bin/bash
clock=$(lscpu | grep "MHz" | awk '/^CPU MHz/ {print $3}' | cut -f1 -d'.')
echo "$clock MHz"
