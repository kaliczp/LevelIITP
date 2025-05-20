## Import
library(readxl)
TP <- as.data.frame(read_excel("Havi T P Level II 2017-2022.xlsx", skip = 1))

## Date
DateTP <- seq.Date(from = as.Date("2017-01-15"),
                   to = as.Date("2022-12-15"),
                   by = "months")
## Test plot
library(xts)
plot(xts(TP[,4], DateTP))
