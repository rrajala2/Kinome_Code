#!/bin/env Rscript

# Prepare phosphorylation data for upload to
#   https://kinase-library.phosphosite.org/ea?a=de

# Minimum Expected input columns:
# Protein	Description	Gene_Name	Annotated_Sequence	PhosRS	p-value	log2FC

#Load needed libraries
library(stringr)
library(glue)

# Get the arguments from the command line (but don't include this script file)
args <- commandArgs(trailingOnly = TRUE)

input_file <- args[1]
output_file <- args[2]
sink(output_file)

# NOTE: Not handled: case in which no file or more than one file specified

phospho_raw <- read.csv(input_file)

# NOTE: Not considering percentages

# Print header
print(glue("Protein\t",
           "Description\t",
           "Gene_Name\t",
           "Annotated_Sequence\t",
           "log2FC\t",
           "p-value\n"))

# Traverse the CSV file, one row at time
for (i in seq_len(nrow(phospho_raw))) {

    # Get current row
    my_row <- phospho_raw[i, ]

    # Get list of phosphorylation sites
    phosphos <- str_split_1(my_row$PhosRS, "; ")

    # Print row once per phosphorylation site
    for (phospho in phosphos) {

        # Remove starting character
        number_etc <- substring(phospho, 2)

        # Phosphorylation position comes before the parenthesis
        phos_position_str <- str_split_1(number_etc, "\\(")[[1]]

        # Convert string to number
        phos_position <- as.numeric(phos_position_str)

        # All amino acid characters up to and included the phosphorylated one
        before_asterisk <- substring(my_row$Annotated_Sequence, 1, phos_position)

        # All amino acid characters after the phosphorylated one
        after_asterisk  <- substring(my_row$Annotated_Sequence, phos_position + 1)

        # Put the pieces together with an asterisk in between
        output_seq <- glue(before_asterisk, "*", after_asterisk)

        print(glue("{my_row$Protein}\t",
                   "{my_row$Description}\t",
                   "{my_row$Gene_Name}\t",
                   "{output_seq}\t",
                   "{my_row$log2FC}\t",
                   "{my_row$p.value}\n"))
    }
}

# To get the last three columns
# cut -f4-6 -d$'\t' output.tsv > last_three_cols.tsv
