# linear regression libraries
# -----------------------------

#?knnreg

#data(BloodBrain)
#bb = bbbDescr
#head(bb)

data()
set.seed(123)

cars=read.csv("F:/aegis/4 ml/dataset/supervised/regression/auto/cars.csv",header = T)

head(cars)
cars$name=NULL

## split data into training and testing (70-30 or 80-20)
# -----------------------------------------------------
sample_size<-floor(0.7 * nrow(cars))
train_ind<-sample(seq_len(nrow(cars)), size=sample_size)
train<-cars[train_ind,]
test<-cars[-train_ind,]

# split further into X and Y
# --------------------------
colnames(train)
train_x = train[,2:ncol(train)]
train_y = train[,1]
test_x = test[,2:ncol(test)]
test_y = test[,1]

# do CV to get the value of neighbours (k)
# ----------------------------------------

# model building in kNN
# ----------------------
m1 = knnreg(train_x,train_y,k=3)
summary(m1)

# predict
# --------
pdct1 = predict(m1,test_x)

# create data frame to store results: actual and predicted
# --------------------------------------------------------
df1 = data.frame(actual = test_y,
                 predicted=pdct1,
                 difference=test_y-pdct1,
                 diff_square = (test_y-pdct1)^2)

head(df1,15)

mse1=sum(df1$diff_square)
r1=nrow(df1)
mse1/r1
sqrt(mse1)

# linear regression
# -----------------
lm1 = lm(mpg~., data=train)
p_lm1 = predict(lm1,test)
df2 = data.frame(actual=test$mpg, 
                 lm_predic=p_lm1,
                 difference=test$mpg-p_lm1,
                 diff_square=(test$mpg-p_lm1)^2)

head(df2,15)

mse2=sum(df2$diff_square)
r2=nrow(df2)
mse2/r2
sqrt(mse2)


data("GermanCredit")
gc = GermanCredit
write.csv(gc, "germancredit.csv")
getwd()
