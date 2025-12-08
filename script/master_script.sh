#!/bin/bash

# 1st script, kneaddata for quality filtering
echo "Running Bash script 1..."
bash 0_kneaddata.sh

# 2nd script, kraken for taxonomy classification
echo "Running Bash script 2..."
bash 1_kraken2.sh

# 3rd script, R braken classification


# 4th script: R 0_Filtering_Diversity_DA.Rmd
# before running this script
Rscript -e "rmarkdown::render(
  '0_Filtering_Diversity_DA.Rmd',
  params = list(
    abundance_table = 'path/to/abundance.csv',
    taxonomy_table = 'path/to/taxonomy.tsv',
    working_dir = '/path/to/project/'
  )
)"

# 5th script, R 1_Pathway_annotation.Rmd
echo "Running R script 5..."
bash script5.sh

# 6th script, R 2_Functional_annotation.Rmd