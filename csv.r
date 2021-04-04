data <- read.csv("data\\pag-sjp-diagnos-lan.csv")

diagnoskapitel_kod <- data[[3]]

sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

print(tail(diagnoskapitel_kod))

barplot(sorted)