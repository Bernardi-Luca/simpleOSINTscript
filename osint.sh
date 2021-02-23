#!/bin/bash
echo "--- script started ---"
mkdir -p ./$1

#commands
theHarvester -d $1 -l 1000 -b all --filename ./$1/theHarvester_$1.xml
#dnsenum --timeout 3 --threads 10 -f /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt $1 -o ./$1/dnsenum_$1
dnsenum --timeout 3 --threads 20 $1 -o ./$1/dnsenum_$1
amass enum -d $1 -passive -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt -o ./$1/amass_passive_$1

echo "--- done ---"
