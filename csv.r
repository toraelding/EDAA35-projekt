data <- read.csv("data\\data.csv")

my_list <- data[[3]] == "F00-F99"
viss_diagnos <- as.numeric(!is.na(data[[11]][my_list]))

print(head(data[[11]][my_list]))
# my_sum <- !is.na(viss_diagnos)
print(head(viss_diagnos))
# print(sum(as.numeric(datka[[11]][my_sum])))

# diagnoskapitel_kod <- data[[3]]

# sorted <- sort(table(diagnoskapitel_kod), decreasing = TRUE)

# print(tail(diagnoskapitel_kod))

# barplot(sorted)