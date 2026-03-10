# multiomics-fermentation-pipeline
MuliOmicsFermentation is a workflow for identifying the dynamics of microorganisms, pathways and metabolites throughout the fermentation process in a Picolit variety.
The final output is a multi-layered network, where each layer corresponds to a different time point during fermentation.

This workflow leverages multiple programming languages, including R, Python, and Bash.

Below is an image illustrating the initial inputs and the final table used to construct the network:

<img width="781" height="269" alt="Screenshot 2025-12-04 at 09 24 06" src="https://github.com/user-attachments/assets/f35888dc-a37d-4a38-b31c-4adb3bd992b1" />

## :twisted_rightwards_arrows: Workflow overview
In reality in the middle, there are many more steps...
summarized in the following diagram:

<img width="522" height="428" alt="image" src="https://github.com/user-attachments/assets/bbdd70b6-1845-47d0-ad18-c287a8691ca0" />


Among the different steps of the pipeline:

1. **Preprocessing** of the data
2. **Taxonomic classification** and **differential abundance** of taxa between time points
3. **Discovering** of the **pathways** potentially expressed and definition of the pathways enriched for each time point
4. **Metabolites classification** into chemical groups and search for enriched metabolites per time point
5. **Integration** of all the data and **Network analysis**

<img width="349" height="208" alt="image" src="https://github.com/user-attachments/assets/a84b81d0-b2aa-49e6-b27c-e444886931e1" />

## :inbox_tray: :outbox_tray: Pipeline Inputs, Outputs and Dependencies
**:inbox_tray: Input**
- pair-end FASTQ files
- metadata table
- metabolomics tables
- reference databases when needed

**:outbox_tray: Output**
- taxonomic abundance tables
- KEGG/COG aggregated tables
- diversity plots
- differential abundance results
- correlation and network objects/figures

**:toolbox: Software/dependencies**
- FastQC
- MultiQC
- KneadData
- Kraken2 + Braken
- MEGAHIT
- Prodigal
- CD-HIT
- eggNOG-mapper
- R (vegan, phyloseq, clusterProfiler)
- Python
- Bash

## :gear: How to use
There is the master script that orchestrate all the scripts that have to be used, it is important to put in the master script the input files required, 
and to create a specific tree of directories (starting from the working directory), that is explained in the master script before each command.

The output of the scripts are figures and tables and will be saved in the correspondent folders at each stage of the analysis.

## 🗃️ Repository structure
- /scripts folder contains only executable codes from the command line.
- /notebook folder contains Rmd and Jupyter analysis with descriptive parts and figures.
- /example_data folder contains all the data. (available only in the private version of this repository)
- /results

## :key: Key analysis implemented
- taxonomic profiling of bacterial and fungal communities
- functional pathway reconstruction from metagenomic data
- integration of taxonomic, functional, and metabolic layers
- diversity, ordination, and differential abundance analyses
- microbial-metabolite-pathway network reconstruction
