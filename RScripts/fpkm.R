# Directory Path
htseq.dir <- "./Parsed"
# Htseq sample files
htseq.sample.files <- grep("ACAR-KAG",list.files(htseq.dir),value=TRUE)
# Htseq samples
htseq.samples <- gsub("\\.txt$", "", htseq.sample.files)
# Conditions
sample.condition <- c("female","female", "female", "male", "male", "male")
htseq.sample.files
# Building dataframe
sample.table <- data.frame(sampleName = htseq.samples,
                           fileName = htseq.sample.files,
                           condition = sample.condition)
sample.table$condition <- factor(sample.table$condition)
# DESeq2
# BiocManager::install("DESeq2", INSTALL_opts = '--no-lock')
library("DESeq2")
dds <- DESeqDataSetFromHTSeqCount(sampleTable = sample.table,
                                  directory = htseq.dir,
                                  design= ~ condition
)
# Make txdb object from  gff3
# BiocManager::install("GenomicFeatures", INSTALL_opts = '--no-lock')
library("GenomicFeatures")
txdb <- makeTxDbFromGFF(file="./merged.gtf",
                        format='gtf',
                        dataSource="gtf file for A. costaricensis",
                        organism="Angiostrongylus costaricensis")
txdb
# Calculate base exons base pairs of each gene
x <- exonsBy(txdb, by="tx")
head(x)
# Sum exons base pairs of each gene
basepairs <- sum(width(reduce(x)))

# Add column of base pairs on dds object
mcols(dds)$basepairs <- basepairs
#write base pair lengths
write.csv(basepairs, 
          file="gene_length.csv")
# calculate fpkm
fpkm <- fpkm(dds)
# Count the number of genes
nrow(dds)
# Count info
counts <- as.data.frame(counts(dds))
# Write count info
write.csv(counts, 
          file="htseq-count.csv")
# Write fpkm
write.csv(fpkm, 
          file="fpkm.csv")

