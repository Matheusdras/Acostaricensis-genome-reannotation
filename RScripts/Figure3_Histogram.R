library(ggplot2)
library(hrbrthemes)
library(viridis)
library(dplyr)
library(forcats)
library(ggridges)

df <- read.csv('gene_transcript.csv', header = FALSE)
df <- df %>% 
  group_by(V1,V3) %>% 
  summarize_all(sum)
df$V3 <- factor(df$V3 , levels=c("Reference transcript", "Split transcript", "Merged transcript", "Reference transcript variant", "Novel transcript variant", "Novel transcript"))

# calculate the mean per group
mean.value <- df %>% 
  group_by(V3) %>%
  summarize(mean = mean(V2))

mean.value

p <- df %>%
  ggplot( aes(x=V2, color=V3, fill=V3)) +
  geom_histogram(alpha=0.6, binwidth = 1) +
  scale_fill_viridis(discrete=TRUE) +
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("") +
  ylab("") +
  geom_vline(data = mean.value, mapping = aes(xintercept = mean)) +
  facet_wrap(~V3, ncol = 1)

p <- p + scale_x_continuous(n.breaks = 10) # scale x limits based on ylim1
p <- p + scale_y_continuous(n.breaks = 4) # scale y limits based on ylim1
p


df <- read.csv('transcript_exon.csv', header = FALSE)
df <- df %>% 
  group_by(V1,V3) %>% 
  summarize_all(sum)
df$V3 <- factor(df$V3 , levels=c("Reference transcript", "Split transcript", "Merged transcript", "Reference transcript variant", "Novel transcript variant", "Novel transcript"))

# calculate the mean per group
mean.value <- df %>% 
  group_by(V3) %>%
  summarize(mean = mean(V2))

mean.value

p <- df %>%
  ggplot( aes(x=V2, color=V3, fill=V3)) +
  geom_histogram(alpha=0.6, binwidth = 1) +
  scale_fill_viridis(discrete=TRUE) +
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.background = element_blank(), axis.line = element_line(colour = "black")
  ) +
  xlab("") +
  ylab("") +
  geom_vline(data = mean.value, mapping = aes(xintercept = mean)) +
  facet_wrap(~V3, ncol = 1)

p <- p + scale_x_continuous(n.breaks = 10) # scale x limits based on ylim1
p <- p + scale_y_continuous(n.breaks = 5) # scale y limits based on ylim1
p
