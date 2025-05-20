## Import
library(readxl)
TP <- as.data.frame(read_excel("Havi T P Level II 2017-2022.xlsx", skip = 1))

## Date
DateTP <- seq.Date(from = as.Date("2017-01-15"),
                   to = as.Date("2022-12-15"),
                   by = "months")

## Create list
library(xts)
TPlst <- list()
TPlst[[1]] <- xts(TP[,3:4], DateTP)
TPlst[[2]] <- xts(TP[,7:8], DateTP)
TPlst[[3]] <- xts(TP[,11:12], DateTP)
TPlst[[4]] <- xts(TP[,15:16], DateTP)
TPlst[[5]] <- xts(TP[,19:20], DateTP)

for(ttactual in 1:length(TPlst))
    names(TPlst[[ttactual]]) <- c("P","T")

names(TPlst) <- c("M01, M03", "M15, M16", "M17", "M19", "M21")

## Test plot
ttactual <- 1
plot(TPlst[[ttactual]][,"T"])
