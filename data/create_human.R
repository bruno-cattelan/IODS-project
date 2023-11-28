library(readr)
library(dplyr)

hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")

dim(hd)
dim(gii)

summary(hd)
summary(gii)

# Rename the variables with shorter and easier to work with names
hd <- hd %>% rename(HDI = `Human Development Index (HDI)`, LEB = `Life Expectancy at Birth`, EYE = `Expected Years of Education`,
              MYE = `Mean Years of Education`, GNI = `Gross National Income (GNI) per Capita`, 
              GNImHDI = `GNI per Capita Rank Minus HDI Rank`)

gii <- gii %>% rename(GII = `Gender Inequality Index (GII)`, MMR = `Maternal Mortality Ratio`, ABR = `Adolescent Birth Rate`,
                      PRP = `Percent Representation in Parliament`, PSEf = `Population with Secondary Education (Female)`,
                      PSEm = `Population with Secondary Education (Male)`, LFPRf = `Labour Force Participation Rate (Female)`,
                      LFPRm = `Labour Force Participation Rate (Male)`)

# Create the two new columns
gii["PSEratio"] <- gii$PSEf/gii$PSEm
gii["LFPRratio"] <- gii$LFPRf/gii$LFPRm

# Merge the datasets
human <- inner_join(hd, gii, by = "Country")

# Save dataframe
write.csv(human, "data/human.csv")
# Read it again
human2 = read.table("data/human.csv",header = TRUE, sep = ",", row.names = 1)
# And take a look at its structure and values. Everything seems in order!
str(human2)
head(human2)