# Logistic regression to determine Breast disease
path="F:/work/2 mypresentation/2 ml/2 algorithms/1 supervised/level I/2 logisticregression/r/1 ml/2 bbd/bbd.csv"
bbd = read.csv(path, header=T, stringsAsFactors = F)
head(bbd)
tail(bbd)

# get the count and proportion of 1 and 0
table(bbd$diagnosis)
100*prop.table(table(bbd$diagnosis))

# convert features into factor variables wherever reqd
unique(bbd$observation)
bbd$observation = as.factor(bbd$observation)

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


# logistic regression - build the model
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

# check the count to convert probabilites to 0/1
table(test$diagnosis)

cutpoint = 0.5
predictions = ifelse(preds <=0.5, 0,1)

# confusion matrix
# 1 --> positive class
library(caret)
confusionMatrix(as.factor(test$diagnosis), as.factor(predictions), positive="1")