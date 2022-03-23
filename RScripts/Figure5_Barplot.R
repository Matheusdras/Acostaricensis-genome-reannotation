library(ggplot2)
library(tidyr)
library(dplyr)
pep.saavs <- read.csv('./IDENTIFIED_SAAVS_R.tab', sep = '\t', header = FALSE)
annovar <- read.csv('./annovar_parsed_conservation.tab', sep = '\t', header = FALSE)

head(annovar)
annovar <- select(annovar, -c(V3, V4, V5))
annovar <- annovar %>% count(V1, V2, V6)

mean.1 <- aggregate(annovar$n, list(annovar$V2), FUN=mean)
sd.1 <- aggregate(annovar$n, list(annovar$V2), FUN=sd)

mean.2 <- aggregate(annovar$n, list(annovar$V6), FUN=mean)
sd.2 <- aggregate(annovar$n, list(annovar$V6), FUN=sd)

mean.2$Group.2 <- c('nonsynonymous')
sd.2$Group.2 <- c('nonsynonymous')

mean <- merge(mean.1, mean.2, all=TRUE)
mean <- filter(mean,  Group.1 != "nonsynonymous")
mean$Group.1 <- c('Conservative AA', 'Nonconservative AA', 'NA', 'NA', 'NA')
mean$Group.2 <- c('nonsynonymous', 'nonsynonymous', 'stopgain', 'stoploss', 'synonymous')

sd <- merge(sd.1, sd.2, all=TRUE)
sd <- filter(sd,  Group.1 != "nonsynonymous")
sd$Group.1 <- c('Conservative AA', 'Nonconservative AA', 'NA', 'NA', 'NA')
sd$Group.2 <- c('nonsynonymous', 'nonsynonymous', 'stopgain', 'stoploss', 'synonymous')

ggplot(mean, aes(x=Group.2, y=x, fill = Group.1)) +
  geom_bar(stat="identity", color="black", position=position_dodge()) +
  geom_errorbar(aes(ymin=x, ymax=x+sd$x), width=.2, position=position_dodge(.9)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  scale_color_manual(values=c("darkblue", "#999999", "darkgreen")) + 
  scale_fill_manual(values=c("darkblue", "#999999", "darkgreen" ))


pep.saavs <- select(pep.saavs, -c(V2, V3, V4, V5, V7))
pep.saavs <- pep.saavs %>% count(V1, V6)
head(pep.saavs)

mean <- aggregate(pep.saavs$n, list(pep.saavs$V6), FUN=mean)
sd <- aggregate(pep.saavs$n, list(pep.saavs$V6), FUN=sd)
mean$Group.1 <- c('Conservative AA', 'Nonconservative AA')
sd$Group.1 <- c('Conservative AA', 'Nonconservative AA')

head(mean)

ggplot(mean, aes(x=Group.1, y=x, fill = Group.1)) +
  geom_bar(stat="identity", color="black", position=position_dodge()) +
  geom_errorbar(aes(ymin=x, ymax=x+sd$x), width=.2, position=position_dodge(.9)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  scale_color_manual(values=c("darkblue", "darkgreen")) + 
  scale_fill_manual(values=c("darkblue", "darkgreen" ))