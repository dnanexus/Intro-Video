#!/bin/bash
set -ex

# Download input
dx download "$vcf"

# Run vcftools
vcftools --gzvcf *.vcf.gz --max-missing-count 0 --singletons

# Upload outputs
dx-jobutil-add-output singletons `dx upload out.singletons -o singletons.txt --brief`
