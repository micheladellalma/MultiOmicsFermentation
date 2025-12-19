#!/bin/bash

# 1. KNEADDATA
echo "Running Bash script 1..."
bash 0_kneaddata.sh

# 2. KRAKEN TAXONOMY CLASSIFICATION
echo "Running Bash script 2..."
bash 1_kraken2.sh

# 3. BRAKEN
echo "Running R script 3..."

# 4. FILTERING, DIVERSITY AND DA: R 0_Filtering_Diversity_DA.Rmd
# Before RUNNING the master script, CREATE this directories
# "results/0_Filtering_Diversity_DA/figures"
# "results/0_Filtering_Diversity_DA/tables"

# things to take into consideration before running this code:
# define the rows of the dataset to keep
echo "Running R script 4 Filtering, Diversity and Differential Abundance"
Rscript -e "rmarkdown::render(
  '0_Filtering_Diversity_DA.Rmd',
  params = list(
    abundance_table = 'data/abundance.csv',
    taxonomy_table = 'data/taxonomy.tsv',
    working_dir = 'data/project/'
  )
)"

# 5. PATHWAY ANNOTATION: R 1_Pathway_annotation.Rmd
# Before RUNNING the master script, CREATE this directories
# ""data/pathway_annotation""
# "results/1_Pathway_annotation/figures
# "results/1_Pathway_annotation/tables
echo "Running R script 5 Pathway annotation"

BASE_DIR="data/pathway_annotation"
RMD_FILE="1_Pathway_annotation.Rmd"

for SAMPLE_DIR in "$BASE_DIR"/*/; do
    SAMPLE_NAME=$(basename "$SAMPLE_DIR")

    KMA_TABLE="{SAMPLE_DIR}/kma_table.csv"
    EGGNOG_TABLE="{SAMPLE_DIR}/eggnog_table.tsv"
    Rscript -e "rmarkdown::render(
       '$RMD_FILE',
       params = list(
         kma_table = '$KMA_TABLE',
         eggnog_table = '$EGGNOG_TABLE',
         sample_name = '$SAMPLE_NAME'
   ),
       output_dir = '$SAMPLE_DIR'
   )"
done

echo "All samples processed"

# 5.1 PATHWAY ANNOTATION 2: R 1.2_Pathway_annotation.Rmd
# Before Running the master script is important to change the condition
# variable (line 72), in order to put your sample names/conditions,
# and in the subsequent code also change the conditions' comparison

# 6. FUNCTIONAL ANNOTATION: R 2_Functional_annotation.Rmd
# Before RUNNING the master script, CREATE this directories
# "results/2_Functional_annotation/figures
# "results/2_Functional_annotation/tables
echo "Running R script 6 Functional annotation"

BASE_DIR="data/functional_annotation"
RMD_FILE="2_Functional_annotation.Rmd"

R script -e rmarkdown::render("2_Functional_annotation.Rmd")