# linear regression
# author: Sriraman CR
install.packages("caret")

library(caret)

path = "C:/Users/DARKLORD/Desktop/Data_Analytics_with_R/concrete.csv"
conc = read.csv(path,header=T)

head(conc)
View(conc)
rows=nrow(conc)
cols=length(colnames(conc))

# print(c(rows,cols))
# paste(rows,cols)
paste("Rows = ", as.character(rows), ", Columns = ", as.character(cols))
View(conc)



#Replacing value of zeroes without including zero

slag_mean = round(mean(conc$slag[conc$slag>0]),2)
flyash_mean = round(mean(conc$flyash[conc$flyash>0]),2)
super_mean = round(mean(conc$superplastisizer[conc$superplastisizer>0]),2)


slag_mean
flyash_mean
super_mean


#updating the dataset now

conc$slag[conc$slag==0] = slag_mean
conc$flyash[conc$flyash==0] = flyash_mean
conc$superplastisizer[conc$superplastisizer==0] = super_mean

# randomly shuffling the dataset
grp = runif(nrow(conc))
conc = conc[order(grp),]


#rename the columns
colnames(conc)
colnames(conc)


install.packages('corrplot')




# apply() 1--> row, 2 --> columns

# check for Nulls, Zeroes
# row_num  = row.names(conc)[apply(conc, 1, function(n) any(n==0))]
# print(row_num)
# if(length(row_num) > 0) print("Zeroes present") else print("No NULLs")

# check for Nulls, Zeroes for all columns


col_name = colnames(conc) [apply(conc, 2, function(n) any(is.na(n)))]

if(length(col_name) > 0) print("NULLs present") else print("No NULLs")

col_name = colnames(conc) [apply(conc, 2, function(n) any(n == ""))]
if(length(col_name) > 0) print("Blanks present") else print("No Blanks")

col_name = colnames(conc) [apply(conc, 2, function(n) any(n==0))]
print(col_name)
if(length(col_name) > 0)
{
  print("Zeroes present in columns : ")
  print(col_name)
} else 
  print("No Zeroes")


# check for outliers
# 1) boxplot
boxplot(conc$cementcomp,horizontal = T)
summary(conc$cementcomp)

boxplot(conc$slag,horizontal = T)

# check for multicollinearity (correlation among the x-variables)
cor(conc[1:8]) # gives values
pairs(conc[1:8]) # graphical shows the relations
colnames(conc)

# split the data into training and testing data
sampledata = sample(2, nrow(conc), 
                    replace = T, 
                    prob = c(0.7,0.3))
train = conc[sampledata==1,]
test = conc[sampledata==2,]

View(train)
View(test)

# total rows
nrow(train); nrow(test)

##### Model building process #####
##### ---------------------------- 
# fit the regression model

# model 1 with all variables
# lm(y-variable ~ glass + superplastisizer + water)

# formula = Y ~ .    ALL x VARIABLES
#          Y ~ x1+x2+x3 ONLY 3 X VARIABLES

lm1 = lm(CCS ~ ., data=train)
summary(lm1)

head(train)
head(lm1$residuals)
head(lm1$fitted.values)
head(train$CCS)


# check the assumptions of the linear model
# ---------------------------------------------
# 1) parameters are linear

# 2) residuals mean is 0
mean(lm1$residuals)
lm1$residuals

# 3) residuals have constant variance
# par(mfrow=c(2,2))
plot(lm1)
# Plot 1: residuals vs fitted plot
# Along the x-axis, the fitted values for residuals increase and then
# decrease. (as shown by the red line). 
# It should be approximately flat

# Similar plot is Plot 3: scale-location
# Y-values are standardized values

# 4) residuals are normally distributed
#  Plot 2: Normal Q-Q
# It should be overall a straight line along the diagonal
# deviations along the two ends are expected
# Also indicates outliers

# 4) x-variables and residuals are not related
cor.test(train$cementcomp,lm1$residuals)
nrow(conc)
length()

# check for the cor value

# 5) Number of observations > Number of X's
# check the row count and column count

##### end of assumptions checking. Stop here to correct data points


# r-square value
r2 = summary(lm1)$r.squared
residuals(lm1)
coefficients(lm1)

# adjusted r2
# 1 - ((1-r2)(n-1) / n-p-1)
n = nrow(train); print(n)
p = length(colnames(train))-1; print(p)

1-(1-r2)*(n-1)/(n-p-1)

# predict the CCS with all the X-values
pdct1 = predict(lm1, test)
length(pdct1)

# table showing the difference between the actual and predicted values
actualCSS = test$CCS
predCSS = pdct1
difference = actualCSS - predCSS
dfCSS = data.frame(actualCSS, predCSS,difference)
View(dfCSS)