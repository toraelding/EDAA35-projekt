data <- read.csv("data\\data.csv")

diagnoskapitel_kod <- data[[3]]

sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

print(tail(diagnoskapitel_kod))

barplot(sorted)