read_json <- function(file = "data.json") {
    jsonlite::fromJSON(file)
}

read_csv <- function(file = "data.csv") {
    data.frame(read.csv(file))
}

# borde testa att läsa in filer etc med xfun också, se om implementationen gör någon skillnad

# table <- tapply(as.numeric(data$antal_man), list(data$ar,data$diagnoskapitel_text), sum)

# print(head(table))

#diagnoskapitel_kod <- data[[3]]

#sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

#print(tail(diagnoskapitel_kod))

#barplot(sorted)
