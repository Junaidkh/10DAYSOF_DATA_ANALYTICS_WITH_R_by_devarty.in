# Logistic regression to determine Breast disease
path="C:/Users/DARKLORD/Desktop/Data_Analytics_with_R/bbd.csv"
bbd = read.csv(path, header=T, stringsAsFactors = F)
head(bbd)
tail(bbd)

View(bbd)


# get the count and proportion of 1 and 0

table(bbd$diagnosis)

100*prop.table(table(bbd$diagnosis))



# convert features into factor variables wherever reqd

unique(bbd$degree)
bbd$degree = as.factor(bbd$degree)

unique(bbd$med_check)
bbd$med_check = as.factor(bbd$med_check)

unique(bbd$nlv)
bbd$nlv = as.factor(bbd$nlv)

unique(bbd$mst)
bbd$mst = as.factor(bbd$mst)



# y-variable has to be a factor
# ------------------------------

levels(bbd$diagnosis)

bbd$diagnosis = as.factor(bbd$diagnosis)

str(bbd)



# split the data into training and testing data
# set.seed(12345)
# randomly shuffle the dataset and sample

grp = runif(nrow(bbd))
bbd = bbd[order(grp),]

bbd$observation=NULL

sampledata = sample(2, nrow(bbd), replace = T, prob = c(0.7,0.3))
train = bbd[sampledata==1,]
test = bbd[sampledata==2,]




#------- logistic regression - build the model ---------
glm_bbd2 = glm(diagnosis ~ stratum +  age + school + degree + med_check
               + agp1 + agmn + nlv + liv + weight + aglp + mst, 
               binomial(link="logit"),
               data=train)
summary(glm_bbd2)

# predict the Binary outcome for attrition_value

# type = "response" gives probabilities

preds = predict(glm_bbd2, test, type="response")
summary(preds)
print(preds[1:20])

length(preds<=0.5)
length(preds>0.5)

# check the count to convert probabilites to 0/1
table(test$diagnosis)

cutpoint = 0.5
predictions = ifelse(preds <=0.5, 0,1)

print(predictions)

# confusion matrix
# 1 --> positive class
library(caret)
install.packages("e1071")

confusionMatrix(as.factor(test$diagnosis), as.factor(predictions), positive="1")





#-------- sir teaches ----------------



preds = predict(glm_bbd2, test, type="response")
preds=data.frame(preds)
head(preds,20)

table(bbd$diagnosis)
prop.table(table(bbd$diagnosis))
prop.table(table(train$diagnosis))

prop.table(table(test$diagnosis))

table(test$diagnosis)
nrow(preds)

length(preds[preds$preds<=0.5,])
length(preds[preds$preds>0.5,])

# update probabilities with classes
preds$preds[preds$preds<=0.5] = 0
preds$preds[preds$preds>0.5]=1



#------------------- Calculating more accurate mdoel ---------------------

path1="C:/Users/DARKLORD/Desktop/Data_Analytics_with_R/bbd.csv"
bbd1 = read.csv(path, header=T, stringsAsFactors = F)
head(bbd1)
tail(bbd1)

View(bbd1)

nrow(bbd1)
ncol(bbd1)

# apply() 1--> row, 2 --> columns
# check for Nulls, Zeroes
# row_num  = row.names(conc)[apply(conc, 1, function(n) any(n==0))]
# print(row_num)
# if(length(row_num) > 0) print("Zeroes present") else print("No NULLs")

# check for Nulls, Zeroes for all columns


col_name = colnames(bbd1) [apply(bbd1, 2, function(n) any(is.na(n)))]

if(length(col_name) > 0) print("NULLs present") else print("No NULLs")

col_name = colnames(bbd1) [apply(bbd1, 2, function(n) any(n == ""))]
if(length(col_name) > 0) print("Blanks present") else print("No Blanks")

col_name = colnames(bbd1) [apply(bbd1, 2, function(n) any(n==0))]

print(col_name)

if(length(col_name) > 0)
{
  print("Zeroes present in columns : ")
  print(col_name)
} else 
  print("No Zeroes")

# get the count and proportion of 1 and 0

table(bbd$diagnosis)

100*prop.table(table(bbd$diagnosis))






















