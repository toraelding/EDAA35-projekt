data <- read.csv("data\\data.csv")

table <- tapply(as.numeric(data$antal_man), list(data$ar,data$diagnoskapitel_text), sum)

#diagnoskapitel_kod <- data[[3]]

#sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

#print(tail(diagnoskapitel_kod))

#barplot(sorted)