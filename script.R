library("microbenchmark")

read_json <- function(file = "data.json") {
    jsonlite::fromJSON(file)
}

read_csv <- function(file = "data.csv") {
    data.frame(read.csv(file))
}

input <- readline(prompt = "1: csv vs json, 2: r vs python ")
reps <- readline(prompt = "number of repetitions: ")

if (input == 1) {
    
    res <- microbenchmark(read_csv(), read_json(), times = reps)

    print(res)

    boxplot(res)
} else if (input == 2) {
    koder <- c("F00-F99", "H00-H59", "H60-H95")
    data <- read_json()

    analyse <- function() {
        urval <- data[data$diagnoskapitel_kod %in% koder, ]
        table <- tapply(suppressWarnings(as.numeric(urval$antal_man)), list(urval$diagnoskapitel_text), sum, na.rm = TRUE)
    }
    
    res <- microbenchmark(analyse(), times = reps)
    print(res)
}
