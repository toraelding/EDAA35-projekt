read_json <- function(file = "data\\data.json") {
    jsonlite::fromJSON(file)
}

read_csv <- function(file = "data\\data.csv") {
    data.frame(read.csv(file))
}

# table <- tapply(as.numeric(data$antal_man), list(data$ar,data$diagnoskapitel_text), sum)

# print(head(table))

#diagnoskapitel_kod <- data[[3]]

#sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

#print(tail(diagnoskapitel_kod))

#barplot(sorted)