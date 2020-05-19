
path= "C:/Users/student/Desktop/wine.csv"
wine=read.csv("wine.csv")



head(wine)

rows=nrow(wine)
cols=length(colnames(wine))





# print(c(rows,cols))
# paste(rows,cols)
paste("Rows = ", as.character(rows), ", Columns = ", as.character(cols))
View(wine)

# randomly shuffling the dataset
grp = runif(nrow(wine))
wine = wine[order(grp),]
print(grp)
print(wine)



# apply() 1--> row, 2 --> columns
# check for Nulls, Zeroes
# row_num  = row.names(conc)[apply(conc, 1, function(n) any(n==0))]
# print(row_num)
# if(length(row_num) > 0) print("Zeroes present") else print("No NULLs")

# check for Nulls, Zeroes for all columns


col_name = colnames(wine) [apply(wine, 2, function(n) any(is.na(n)))]

if(length(col_name) > 0) print("NULLs present") else print("No NULLs")

col_name = colnames(wine) [apply(wine, 2, function(n) any(n == ""))]
if(length(col_name) > 0) print("Blanks present") else print("No Blanks")

col_name = colnames(wine) [apply(wine, 2, function(n) any(n==0))]

print(col_name)

if(length(col_name) > 0)
{
  print("Zeroes present in columns : ")
  print(col_name)
} else 
  print("No Zeroes")





#fix every zero with mean
#for mean,do not consider zero

citric.acid_means = round(mean(wine$citric.acid[wine$citric.acid>0]),2)





super_mean = round(mean(wine$citric.acid[wine$citric.acid>0]),2)
print(super_mean)




#rename the columns
colnames(wine)
colnames(wine)[colnames(wine)=="fixed.acidity"]="f_acid"
colnames(wine)[colnames(wine)=="volatile.acidity"]="v_acid"
colnames(wine)[colnames(wine)=="citric.acid"]="c_acid"
colnames(wine)[colnames(wine)=="residual.sugar"]="r_sugar"
colnames(wine)[colnames(wine)=="chlorides"]="cl"
colnames(wine)[colnames(wine)=="free.sulfur.dioxide"]="f_sd"
colnames(wine)[colnames(wine)=="total.sulfur.dioxide"]="t_sd"
colnames(wine)[colnames(wine)=="density"]="d"
colnames(wine)[colnames(wine)=="sulphates"]="s"
colnames(wine)[colnames(wine)=="alcohol"]="a"
colnames(wine)[colnames(wine)=="quality"]="q"


# check for outliers

# 1) boxplot


boxplot(wine$f_acid,horizontal = T,main="f_acid")

boxplot(wine$s,horizontal = T)
boxplot(conc$slag,horizontal = T,main="slag")#has to be revoked

boxplot(conc$flyash,horizontal = T)
boxplot(conc$flyash,horizontal = T,main="flyash")# has to be revoked

boxplot(conc$water,horizontal = T)
boxplot(conc$water,horizontal = T,main="water")

boxplot(conc$super,horizontal = T)
boxplot(conc$super,horizontal = T,main="super")

boxplot(conc$caggr,horizontal = T)
boxplot(conc$caggr,horizontal = T,main="caggr")

boxplot(conc$faggr,horizontal = T)
boxplot(conc$faggr,horizontal = T,main="faggr")

boxplot(conc$age,horizontal = T)
boxplot(conc$age,horizontal = T,main="age")



# update back to zero
conc$slag[conc$slag==slag_mean]=0
conc$flyash[conc$flyash==flyash_mean]=0
conc$super[conc$super==super_mean]=0





summary(conc$cementcomp)




# check for multicollinearity (correlation among the x-variables)

cor(conc[1:8]) # gives values

pairs(conc[1:8]) # graphical shows the relations for all the columns

install.packages("corrplot")
library(corrplot)

corrs=cor(conc[1:8])
corrplot(corrs,method ="number",type ="lower")#heap map   
# it is the best graph to to understand the corelation between all the columns.




colnames(conc)




# split the data into training and testing data

#1.simple random selection technique
sampledata = sample(2, nrow(conc), 
                    replace = T, 
                    prob = c(0.7,0.3))

train = conc[sampledata==1,]

test = conc[sampledata==2,]

View(train)
nrow(train)#total no. of rows
colnames(train)

View(test)
nrow(test)# total no. of rows
colnames(test)

sort(rownames(train))

# there are 4 other techniques to split the data(try them!)


















