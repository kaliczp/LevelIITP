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
TPlst[[2]] <- xts(TP[,5:6], DateTP)
TPlst[[3]] <- xts(TP[,7:8], DateTP)
TPlst[[4]] <- xts(TP[,9:10], DateTP)
TPlst[[5]] <- xts(TP[,11:12], DateTP)

for(ttactual in 1:length(TPlst))
    names(TPlst[[ttactual]]) <- c("P","T")

names(TPlst) <- c("M01, M03", "M15, M16", "M17", "M19", "M21"
)
## Test plot
pdf()
par(mfrow = c(5,1),
    mar = c(0,4.1,0,4.1),
    oma = c(3.1,0,0.5,0)
    )
for(ttactual in 1:length(TPlst)) {
    ## Precipitation
    plot.zoo(TPlst[[ttactual]][,"P"],
             type = "h",
             lend = "butt",
             col = "#67a9cf",
             ylim = c(240,0),
             xlab = "", ylab = "",
             xaxt = "n", yaxt = "n",
             xaxs = "i", yaxs = "i",
             lwd = 8
             )
    axis(4)
    par(new = TRUE)
    ## Temperature
    plot.zoo(TPlst[[ttactual]][,"T"],
             col = "#ef8a62",
             ylim = c(-10,50),
             xlab = "", ylab = "Temperature",
             xaxt = "n",
             xaxs = "i", yaxs = "i",
             lwd = 3
             )
}
axis.Date(1)
dev.off()
