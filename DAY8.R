#-------------- PROJECT LOAN ---------------

#Reading data
path = read.csv("lendingdata.csv")

#Converting into dataframe
loan = data.frame(path)

#Checking for no. of rows and columns

nrow(loan)
ncol(loan)


#Viewing DataFrame

View(loan)


#Checking for NaN values

col_name1 = colnames(num_data)[apply(num_data, 2, function(n) any(is.na(n)))]
print(col_name1)


#Updating NaN values into Columns which have NaN value

loan$mths_since_last_delinq = ifelse(is.na(loan$mths_since_last_delinq), 
                                         0,
                                         loan$mths_since_last_delinq
)


loan$mths_since_last_record = ifelse(is.na(loan$mths_since_last_record), 
                                         0,
                                         loan$mths_since_last_record
)





# separating the numeric data from numeric-factor data

num_cols = names(loan)[sapply(loan,is.numeric)]


#Loading the numeric data into another variable
num_data=loan[,num_cols]

#Viewing first 4 rows
head(num_data,4)


# apply() 1--> row, 2 --> columns
# check for Nulls, Zeroes
# row_num  = row.names(conc)[apply(conc, 1, function(n) any(n==0))]
# print(row_num)
# if(length(row_num) > 0) print("Zeroes present") else print("No NULLs")





# check for Nulls, Zeroes for all columns


#col_name = colnames(num_data) [apply(num_data, 2, function(n) any(is.na(n)))]

#if(length(col_name) > 0) print("NULLs present") else print("No NULLs")

#col_name = colnames(num_data) [apply(num_data, 2, function(n) any(n == 0))]
#if(length(col_name) > 0) print("Zero present") else print("No Zero")


#Checking for 0 values

#col_name = colnames(num_data)[apply(num_data, 2, function(n) any(n==0))]
#print(col_name)



#Checking for number of columns

ncol(num_data)


#Again checking for NaN values in numeric dataset

col_name1 = colnames(num_data)[apply(num_data, 2, function(n) any(is.na(n)))]
print(col_name1)


# column names of num_data

colnames(num_data)


unique(num_data$loan_amnt)


#Boxplot

boxplot(num_data$loan_amnt,horizontal = T,main="loan_amnt")


boxplot(num_data$funded_amnt,horizontal = T,main="funded_amnt")

boxplot(num_data$funded_amnt_inv,horizontal = T,main="funded_amnt_inv")

boxplot(num_data$term,horizontal = T,main="term")

boxplot(num_data$int_rate,horizontal = T,main="int_rate")

boxplot(num_data$installment,horizontal = T,main="installment")

boxplot(num_data$annual_inc,horizontal = T,main="annual_inc")

boxplot(num_data$dti,horizontal = T,main="dti")

boxplot(num_data$total_pymnt,horizontal = T,main="total_pymnt")

boxplot(num_data$delinq_2yrs,horizontal = T,main="delinq_2yrs")

boxplot(num_data$inq_last_6mths,horizontal = T,main="inq_last_6mths")

boxplot(num_data$mths_since_last_delinq,horizontal = T,main="mths_since_last_delinq")

boxplot(num_data$mths_since_last_record,horizontal = T,main="mths_since_last_record")

boxplot(num_data$open_acc,horizontal = T,main="open_acc")

boxplot(num_data$pub_rec,horizontal = T,main="pub_rec")

boxplot(num_data$revol_bal,horizontal = T,main="revol_bal")

boxplot(num_data$revol_util,horizontal = T,main="revol_util")

boxplot(num_data$total_acc,horizontal = T,main="total_acc")

boxplot(num_data$out_prncp,horizontal = T,main="out_prncp")

boxplot(num_data$total_pymnt_inv,horizontal = T,main="total_pymnt_inv")

boxplot(num_data$total_rec_prncp,horizontal = T,main="total_rec_prncp")

boxplot(num_data$total_rec_int,horizontal = T,main="total_rec_int")

boxplot(num_data$total_rec_late_fee,horizontal = T,main="total_rec_late_fee")

boxplot(num_data$recoveries,horizontal = T,main="recoveries")

boxplot(num_data$collection_recovery_fee,horizontal = T,main="collection_recovery_fee")

boxplot(num_data$last_pymnt_amnt,horizontal = T,main="last_pymnt_amnt")

boxplot(num_data$collections_12_mths_ex_med,horizontal = T,main="collections_12_mths_ex_med")

#dropping the column

num_data$collections_12_mths_ex_med = NULL

colnames(num_data)



#check for multicollinearity(correlation among X variable)

cor(num_data[1:8]) #gives values

pairs(num_data[1:8]) # graphically shows the relation for all the columns 

library(corrplot)

#correlations

corrs = cor(num_data[1:8])

corrplot(corrs,method = "number",type = "lower")



# Making factor variables

num_data$delinq_2yrs = as.factor(num_data$delinq_2yrs)

num_data$pub_rec = as.factor(num_data$pub_rec)


# y-variable has to be a factor
# ------------------------------


num_data$default_ind = as.factor(num_data$default_ind)
levels(num_data$default_ind)

# structure of num_data

str(num_data)




#-------- logistic regression model ---------

#Randomly shuffling the data

grp = runif(nrow(num_data))
loan = num_data[order(grp),]




# split the data into training and testing data

sampledata = sample(2, nrow(num_data), replace = T, prob = c(0.7,0.3))
train = num_data[sampledata==1,]
test = num_data[sampledata==2,]

# build model

glm_bbd2 = glm(default_ind ~ int_rate + dti + loan_amnt + funded_amnt +
                 installment + term + inq_last_6mths + open_acc + revol_util + delinq_2yrs +
                 pub_rec + annual_inc, 
               binomial(link="logit"),
               data=train)
summary(glm_bbd2)

# predict the Binary outcome for attrition_value

# type = "response" gives probabilities

preds = predict(glm_bbd2, test, type="response")
summary(preds)

# check the count to convert probabilites to 0/1
table(num_data$default_ind)

cutpoint = 0.1
predictions = ifelse(preds <=0.1, 0,1)

print(predictions)

# confusion matrix
# 1 --> positive class
library(caret)
install.packages("e1071")
library(e1071)

confusionMatrix(as.factor(test$default_ind), 
                as.factor(predictions), positive="1")

table(as.factor(num_data$default_ind))
table(as.factor(predictions))








#2nd model

# build model

glm_bbd2 = glm(default_ind ~ int_rate + dti + loan_amnt + funded_amnt +
                 installment + term + inq_last_6mths + total_acc+ open_acc +
                 revol_util + delinq_2yrs + total_pymnt +
                 pub_rec + annual_inc, 
               binomial(link="logit"),
               data=train)
summary(glm_bbd2)

# predict the Binary outcome for attrition_value

# type = "response" gives probabilities

preds = predict(glm_bbd2, test, type="response")
preds=data.frame(preds)
summary(preds)

# check the count to convert probabilites to 0/1
table(num_data$default_ind)

cutpoint = 0.1
predictions = ifelse(preds <=0.1, 0,1)

print(predictions)

# confusion matrix
# 1 --> positive class
library(caret)
install.packages("e1071")
library(e1071)

confusionMatrix(as.factor(test$default_ind), 
                as.factor(predictions), positive="1")



