# Ojective of knn() : to classify dataset into categories based on 
# different variables
# dataset: prostate cancer
# type: Classification
# attributes: Integer/Long

# include libraries
# ------------------
library(class)
library(caret)

# select the input dataset
# -------------------------
path="F:/aegis/4 ml/dataset/supervised/classification/cancer/prostate.csv"
canc = read.csv(path,header=T)
View(canc)
head(canc)
# remove this variable as it is not required for SVM
canc$id=NULL

# B -> benign (not dangerous)
# M -> malignant (dangerous)

# KNN requires that the data be scaled for more accurate prediction. 
# to do this, do a Summary of the dataset and decide if it requires scaling or not
# include only the predictor variables (X1,... Xn)
# -------------------------------------------------------------------------
summary(canc)

# for a good model building process, 
# 1) build model without standardization
# 2) build model with standardization
# 3) compare 1 and 2

# get the count of the classes
# -----------------------------
table(canc$diagnosis_result)

# minmax function to be applied to the input dataset
# --------------------------------------------------
minmax = function(x){(x-min(x))/(max(x)-min(x))}

# scale the dataset (only the x-variables)
# get the column number of the target(Y) variable from the original dataset
# -------------------------------------------------------------------------
target_col_number = grep("diagnosis_result", colnames(canc))
# target_col_number = which(colnames(canc)=="Type"); print(target_col_number)

canc_scale = as.data.frame(lapply(canc[,-target_col_number], minmax))
head(canc_scale)
summary(canc_scale)
### KNN scaling ends here ###

canc_scale$diagnosis = canc$diagnosis_result
head(canc_scale)
levels(factor(canc_scale$diagnosis))

str(canc_scale)

# since dataset is grouped based on Type, randomly sort it 
# runif() - random number based on uniform distribution
# ---------------------------------------------------------
grp = runif(nrow(canc_scale))
canc_scale = canc_scale[order(grp),]

# split data into training and test
# --------------------------------------------------
sample_size = floor(0.7*nrow(canc_scale))
sample_ind = sample(seq_len(nrow(canc_scale)), sample_size)
train = canc_scale[sample_ind,]
test=canc_scale[-sample_ind,]
nrow(train); nrow(test)

# check if the classes are present in both train and test
# --------------------------------------------------------
levels(factor(train$diagnosis))
levels(factor(test$diagnosis))

str(canc_scale)

# set the target variable(Y) for training and testing
# ----------------------------------------------------
traintarget=train$diagnosis
testtarget=test$diagnosis

# remove the Y-variable from the train and test dataset
# ------------------------------------------------------
train$diagnosis=NULL; test$diagnosis=NULL

# do a cross-validation to determine the value of K
# pick K which has the maximum accuracy of predictions
# -------------------------------------------------------
result = c(NA)
cv_accuracy = c()

for (i in seq(1,20))
{
    # check the CV with train_x variables with the train_Y_variables
    # ---------------------------------------------------------------
    model_knncv = knn.cv(train, traintarget, k=i)
    cv_accuracy[i] = length(which(model_knncv==traintarget, T)) / length(model_knncv)
}
cv_accuracy

# what is it doing
# ------------------
model_knncv
traintarget
length(which(model_knncv==traintarget))/length(model_knncv)

for(i in 1:20)
{
  s1 = paste("Cross validation ", as.character(i), ". Accuracy = ", as.character(round(cv_accuracy[i],2) ))
  print(s1)
}

# get the best number of neighbours
# --------------------------------------------------
neighbours = which.max(cv_accuracy)
print(neighbours)

# knn() takes 4 params - Training dataset, Test dataset, Factor(training target), k=<n>
predict_target = knn(train, test, traintarget, k=neighbours+1)
# take the prediction that gives the maximum accuracy

table(testtarget)

# create confusion matrix to determine the accuracy
# --------------------------------------------------
table(predicted=predict_target, actual=testtarget)
confusionMatrix(predict_target,testtarget,positive="M")

# model stats
# ------------
# install.packages("gmodels")
library(gmodels)
CrossTable(x=predict_target, y=testtarget)

# Now, build the model with the actual dataset
# ----------------------------------------------