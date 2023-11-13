# Bruno Oliveira Cattelan 13/11/2023 script for chapter 2 exercises.

learning2014data <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=1)

# We can take a look at the data in code using the head function. We are looking at the first 6 rows.
head(learning2014data)

# For exact numbers we can use dim. We have 183 columns and 60 rows.
dim(learning2014data)

# We remove the rows were exam point is 0
learning2014data = learning2014data[learning2014data$Points != 0,]

# Follow the construction of the relevant variables from the link
d_sm = learning2014data$D03+learning2014data$D11+learning2014data$D19+learning2014data$D27
d_ri=learning2014data$D07+learning2014data$D14+learning2014data$D22+learning2014data$D30
d_ue=learning2014data$D06+learning2014data$D15+learning2014data$D23+learning2014data$D31
su_lp=learning2014data$SU02+learning2014data$SU10+learning2014data$SU18+learning2014data$SU26
su_um=learning2014data$SU05+learning2014data$SU13+learning2014data$SU21+learning2014data$SU29
su_sb=learning2014data$SU08+learning2014data$SU16+learning2014data$SU24+learning2014data$SU32
st_os=learning2014data$ST01+learning2014data$ST09+learning2014data$ST17+learning2014data$ST25
st_tm=learning2014data$ST04+learning2014data$ST12+learning2014data$ST20+learning2014data$ST28

Deep=d_sm+d_ri+d_ue
Surf=su_lp+su_um+su_sb
Stra=st_os+st_tm

Df=6 - learning2014data$Df
Dh=6 - learning2014data$Dh

#Attitude=learning2014data$Da+learning2014data$Db+learning2014data$Dc+learning2014data$Dd+learning2014data$De+Df+learning2014data$Dg+Dh+learning2014data$Di+learning2014data$Dj
# Normalize the values by their mean
Attitude = learning2014data$Attitude/10
Deep = Deep/12
Surf = Surf/12
Stra = Stra/8

# Analysis dataset with the variables gender, age, attitude, deep, stra, surf and points 
analysisData = data.frame(learning2014data$gender, learning2014data$Age, Attitude, Deep, Stra, Surf, learning2014data$Points)
colnames(analysisData) <-c("Gender", "Age", "Attitude", "Deep", "Stra", "Surf", "Points")

# Save dataframe
write_csv(analysisData, "data/analysisDataset.csv")
# Read it again
analysisData2 = read_csv("data/analysisDataset.csv", show_col_types = FALSE)
# And take a look at its structure and values. Everything seems in order!
str(analysisData2)
head(analysisData2)
