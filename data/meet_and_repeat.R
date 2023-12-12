library(readr)
library(dplyr)

bprs <- read_delim("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", delim = " ")
rats <- read_delim("data/rats.txt", delim = "\t")

dim(bprs)
dim(rats)

summary(bprs)
summary(rats)

library(data.table)
bprs_long <- melt(setDT(bprs), id.vars = c("treatment","subject"), variable.name = "week")
rats_long <- melt(setDT(rats), id.vars = c("ID","Group"), variable.name = "time")

summary(bprs_long)
summary(rats_long)

# Our new wide datasets now have only 4 columns instead of 11 and 13. Instead of 
# the values being spread through the columns, we create new rows using "id.vars" 
# as the identifiers for representing each value now in a row. 