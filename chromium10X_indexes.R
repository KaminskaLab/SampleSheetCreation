# it is called in a bash script with the same name

setwd(".")

sheet <- read.csv("lowerpart.csv", header = FALSE, sep=",")
idxRef <- read.csv("chromium_sample_indexes.csv", header = FALSE, sep = " ")
idxRef <- idxRef[ , colSums(is.na(idxRef)) == 0]
idx <- read.csv("tmp.txt", header = FALSE)

nr <- lapply(1:dim(idx)[1],function(x){grep(idx[x,1],idxRef[,grep(idx[x,1],idxRef)])})

indexes_10x <- lapply(nr, function(x){return(idxRef[x,1])})

sheet[,6] <- unlist(indexes_10x)

write.table(x = sheet, file = "lower_new.csv", row.names = FALSE, col.names = FALSE, na = "", sep=",")
