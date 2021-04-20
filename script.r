library("microbenchmark")

read_json <- function(file = "data.json") {
    jsonlite::fromJSON(file)
}

read_csv <- function(file = "data.csv") {
    data.frame(read.csv(file))
}

input <- readline(prompt = "1: csv vs json, 2: r vs python ")

if (input == 1) {
    reps <- readline(prompt = "number of repetitions: ")
    res <- microbenchmark(read_csv(), read_json(), times = reps)

    print(res)

    boxplot(res)
} else if (input == 2) {
    # data <- read_csv()
    # table <- tapply(as.numeric(data$antal_man), list(data$ar, data$diagnoskapitel_text), sum)
    # print(head(table))
}




# borde testa att läsa in filer etc med 'xfun' också, se om implementationen gör någon skillnad

# table <- tapply(as.numeric(data$antal_man), list(data$ar,data$diagnoskapitel_text), sum)

# print(head(table))

#diagnoskapitel_kod <- data[[3]]

#sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

#print(tail(diagnoskapitel_kod))

#barplot(sorted)
