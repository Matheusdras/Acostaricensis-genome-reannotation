library(dplyr)
rna <- data.frame(read.csv("FPKM.csv", header = FALSE))
prot <- data.frame(read.csv("NIAF_MEAN.csv", header = FALSE))

colnames(rna) <- c("Locus", "1", "2", "3", "4", "5", "6")
colnames(prot) <- c("Locus", "1", "2", "3", "4", "5", "6", "7", "8")

prot[prot==0] <- NA
rna[rna==0] <- NA
prot$`1` <- as.numeric(prot$`1`)
nrow(prot)

row.names(rna) <- rna$Locus
row.names(prot) <- prot$Locus

rna <-  as.data.frame(cbind(rna[5:7], rowMeans(rna[5:7], na.rm=TRUE)))
prot <- as.data.frame(cbind(prot[6:9], rowMeans(prot[6:9], na.rm=TRUE)))


data <- merge(rna, prot, by = 'row.names')
head(data)

data <- data[, c(1, 5, 10)]

row.names(data) <- data$Row.names 
data <- data[, c(2, 3)]

colnames(data) <- c('FPKM', 'NIAF')

data[data==0] <- NA
data <- data[complete.cases(data), ]
nrow(data)

hist(log10(data$NIAF))
hist(log10(data$FPKM))

shapiro.test(log10(data$FPKM))
shapiro.test(log10(data$NIAF))

log10 <- log10(as.matrix(data))
zscore <- scale(log10, center = TRUE, scale = TRUE)

library(ComplexHeatmap)
ht <- Heatmap(zscore, 
              show_row_names = FALSE,
              row_km = 10,
              cluster_rows = TRUE,
              row_dend_reorder = TRUE,
              column_title_side = "top", 
              show_column_dend = FALSE, 
              column_names_rot = 45, 
              column_names_centered = TRUE,
              cluster_row_slices = FALSE,
              column_order = c('FPKM', 'NIAF'), 
)
heatmap <- draw(ht)

c1 <- t(t(row.names(data[row_order(heatmap)[[1]],])))
c1 <- data[rownames(data) %in% c1, ]
write.table(c1,"c1_ids_average.csv", sep=",", quote=F)

c2 <- t(t(row.names(data[row_order(heatmap)[[2]],])))
c2 <- data[rownames(data) %in% c2, ]
write.table(c2,"c2_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster three
c3 <- t(t(row.names(data[row_order(heatmap)[[3]],])))
c3 <- data[rownames(data) %in% c3, ]
write.table(c3,"c3_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster four
c4 <- t(t(row.names(data[row_order(heatmap)[[4]],])))
c4 <- data[rownames(data) %in% c4, ]
write.table(c4,"c4_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster five
c5 <- t(t(row.names(data[row_order(heatmap)[[5]],])))
c5 <- data[rownames(data) %in% c5, ]
write.table(c5,"c5_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster one
c6 <- t(t(row.names(data[row_order(heatmap)[[6]],])))
c6 <- data[rownames(data) %in% c6, ]
write.table(c6,"c6_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster two
c7 <- t(t(row.names(data[row_order(heatmap)[[7]],])))
c7 <- data[rownames(data) %in% c7, ]
write.table(c7,"c7_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster three
c8 <- t(t(row.names(data[row_order(heatmap)[[8]],])))
c8 <- data[rownames(data) %in% c8, ]
write.table(c8,"c8_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster four
c9 <- t(t(row.names(data[row_order(heatmap)[[9]],])))
c9 <- data[rownames(data) %in% c9, ]
write.table(c9,"c9_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster five
c10 <- t(t(row.names(data[row_order(heatmap)[[10]],])))
c10 <- data[rownames(data) %in% c10, ]
write.table(c10,"c10_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster one
c11 <- t(t(row.names(data[row_order(heatmap)[[11]],])))
c11 <- data[rownames(data) %in% c11, ]
write.table(c11,"c11_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster two
c12 <- t(t(row.names(data[row_order(heatmap)[[12]],])))
c12 <- data[rownames(data) %in% c12, ]
write.table(c12,"c12_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster three
c13 <- t(t(row.names(data[row_order(heatmap)[[13]],])))
c13 <- data[rownames(data) %in% c13, ]
write.table(c3,"c13_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster four
c14 <- t(t(row.names(data[row_order(heatmap)[[14]],])))
c14 <- data[rownames(data) %in% c14, ]
write.table(c14,"c14_ids_average.csv", sep=",", quote=F)
# Saving row names of cluster five
c15 <- t(t(row.names(data[row_order(heatmap)[[15]],])))
c15 <- data[rownames(data) %in% c15, ]
write.table(c15,"c15_ids_average.csv", sep=",", quote=F)








