## Import
library(readxl)
TP <- as.data.frame(read_excel("Havi T P Level II 2017-2022.xlsx", skip = 1))

## Date
DateTP <- seq.Date(from = as.Date("2017-01-15"),
                   to = as.Date("2022-12-15"),
                   by = "months")
library(xts)
M01M03 <- xts(TP[,3:4], DateTP)
M15M16 <- xts(TP[,7:8], DateTP)
M17 <- xts(TP[,11:12], DateTP)
M19 <- xts(TP[,15:16], DateTP)
M21 <- xts(TP[,19:20], DateTP)

## Test plot
plot(M01M03)
