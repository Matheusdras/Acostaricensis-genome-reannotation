library(ggplot2)
library(hrbrthemes)
library(viridis)
library(dplyr)
df <- read.csv('transcript_lenght_labels.tab', header = FALSE, sep = "\t")
# I reorder the groups order : I change the order of the factor data$names
df$V3 <- factor(df$V3 , levels=c("Reference transcript", "Split transcript", "Merged transcript", "Reference transcript variant", "Novel transcript variant", "Novel transcript"))

# calculate the mean per group
mean.value <- df %>% 
  group_by(V3) %>%
  summarize(mean = mean(V2))

mean.value
p <- ggplot(df, aes(x=V3, y=V2, fill=V3)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="C") +
  theme_classic() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("") +
  ylab("")

p <- p + stat_summary(fun="mean", geom="crossbar", color="black")

p <- p + scale_y_continuous(n.breaks = 10)#, limits = ylim1*1.05) # scale y limits based on ylim1

p

# calculate the mean per group
median.value <- df %>% 
  group_by(V3) %>%
  summarize(median = median(V2))



df <- read.csv('exon_lenght_labels.tab', header = FALSE, sep = "\t")
# I reorder the groups order : I change the order of the factor data$names
df$V4 <- factor(df$V4 , levels=c("Reference transcript", "Split transcript", "Merged transcript", "Reference transcript variant", "Novel transcript variant", "Novel transcript"))
df <- subset(df, V3 < 8000) 
View(df)
## calculate the mean per group
mean.value <- df %>% 
  group_by(V4) %>%
  summarize(mean = mean(V3))
mean.value

p <- ggplot(df, aes(x=V4, y=V3, fill=V4)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="C") +
  theme_classic() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("") +
  ylab("")

p <- p + scale_y_continuous(n.breaks = 15)#, limits = ylim1*1.05) # scale y limits based on ylim1

p <- p + stat_summary(fun="mean", geom="crossbar", color="black")

p

# calculate the mean per group
mean.value <- df %>% 
  group_by(V4) %>%
  summarize(mean = mean(V3))

mean.value
