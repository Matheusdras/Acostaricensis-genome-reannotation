library(ggplot2)
library(reshape2)
library(dplyr)
rna <- read.csv('FPKM.labels.csv', header = FALSE)
prot <- read.csv('NIAF_MEAN.labels.csv', header = FALSE)
colnames(rna) <- c('Locus', '1', '2', '3', '4', '5', '6', 'Group')
colnames(prot) <- c('Locus', '1', '2', '3', '4', '5', '6', '7', '8', 'Group')

rna <- melt(rna)
prot <- melt(prot)

rna$Group <- factor(rna$Group, levels=c('Reference transcripts (WormBase)','Transcripts from split genes (WormBase)','Reference transcript variants (WormBase)','Novel transcripts (BRAKER)', 'Transcripts from merged genes (BRAKER)', 'Novel transcript variants (BRAKER)'))
prot$Group <- factor(prot$Group, levels=c('Reference proteins (WormBase)','Proteins from split genes (WormBase)','Reference proteoforms (WormBase)','Novel proteins (BRAKER)', 'Proteins from merged genes (BRAKER)', 'Novel proteoforms (BRAKER)'))

ggplot(rna, aes(x=variable, y=log10(value + 1), fill=Group)) +
  geom_boxplot() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("Samples") +
  ylab("Log10(FPKM + 1)") +
  facet_wrap(~factor(Group, levels=c('Reference transcripts (WormBase)','Transcripts from split genes (WormBase)','Reference transcript variants (WormBase)','Novel transcripts (BRAKER)', 'Transcripts from merged genes (BRAKER)', 'Novel transcript variants (BRAKER)')))

             

ggplot(prot, aes(x=variable, y=log10(value), fill=Group)) +
  geom_boxplot() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("Samples") +
  ylab("Log10(NIAF)") +
  facet_wrap(~factor(Group, levels=c('Reference proteins (WormBase)','Proteins from split genes (WormBase)','Reference proteoforms (WormBase)','Novel proteins (BRAKER)', 'Proteins from merged genes (BRAKER)', 'Novel proteoforms (BRAKER)')))

mean(rna$value, na.rm = TRUE)
mean(prot$value, na.rm = TRUE)

## calculate the mean per group
rna %>% 
  group_by(Group) %>%
  summarize(mean = mean(value, na.rm = TRUE))

prot %>% 
  group_by(Group) %>%
  summarize(mean = mean(value, na.rm = TRUE))
