
#------------------------------   STATISTICS --------------------------------------

# Stats is all about data

concrete

#-------- Type of datas file format ---------

#JSON - JAVA SCRIPT OBJECT NOTATION
#CSV - COMMA SEPARATED VALUE

#Delimiter is used in industries to separate data
# it can be $ , ~ , |

#FWF - fixed width format
#freetext data

#-------------------------------


#---------------- data type ----------------
#1)Numeric 
#2)character - i)factor/categorical data. ii)character data
#3)date - used in time series analysis.


#Factor data types:
#1)Nominal - name is important not order
#2)Ordinal - order is important rather than name
#3)Interval - numerical scales where order and difference are known, it 
#             does not have a true 0.In this 0 is valid.  examples:-Temperature,time
#4)Ratio - In this example 0 is not valid.

#-------------------------------------------


degree = c("EEE","CS","Mech","Civil","Chem","IT")
typeof(degree)
str(degree)

degree = as.factor(degree)

str(degree)

#---------------- Types of statistics ------------

#1) Descriptive statistics - Describe the various aspects of dataset
#2) Inferential statisctics - What conclusion can be drwan from the dataset



#-------------------------------------------------


#------------------------------- DESCRIPTIVE STATISTICS ------------------------------------

num1 = floor(runif(50,1,99))
num1

mean(num1)

num1 = c(num1,250)

mean(num1)

homework = floor(runif(5,1,99))
Quiz = floor(runif(5,1,99))
Assignment = floor(runif(5,1,99))
Term = floor(runif(5,1,99))
Final = floor(runif(5,1,99))

Student = c(1,2,3,4,5)

Actual = list("Student" = Student,"Homework" = homework, "Quiz" = Quiz
              ,"Assignment" = Assignment,"Term" = Term,"Final" = Final)
Actual = data.frame(Actual)
Actual
#20,10,10,25,35


Actual[1,2]
Actual

x 


weight = c()
for(i in seq(5))
{
  weight[i] = ((0.2*Actual[i,2]) +
    (0.1*Actual[i,3]) 
  +(0.1*Actual[i,4])
  +(0.25*(Actual[i,5])) +
    (0.35*Actual[i,6])   )
}
weight

updated = cbind(Actual,weight)
updated


#------ median ---------

median(num1)
sort(num1)
mean(num1)
mode(num1) #it doesn't give any value

#---------------------------- Measure of dispersion ---------------------------

#Skewness can be removed by taking log,square root or inverse of the data.

print(sort(num1))

#---- range function - it is the difference between the maximum and minimum---------

max(num1)-min(num1)
# we don't use range generally we only use it in good data

#------


#---------Quartiles---------

#Quartile2,Q2 = mean value

#quartiles lies between minimum and maximum

num1 = floor(runif(50,1,99))

sort(num1)

quantile(num1)

#with the help of quartile we can identify which type of skewness it is
#whether it is left or right skewed

#---------------------------


#-------deciles---------
#data into 10 parts

seq1 = seq(.1,1,.1)
quantile(num1,seq1)

#----------- Plot the quartiles using boxplot -----------

boxplot(num1,horizontal = T)


# After using outlier

num1 = c(num1,250)

boxplot(num1,horizontal = T)


#--------- Standard deviation------------

sd(num1)
mean(num1)-25



#--------------- Histogram --------------

hist(num1,col = "blue")

num2 = runif(50,95,105)

hist(sort(num2),col = "green")


#------- create a frequency distribution table --------


Temp = cut(num2,5)

cbind(frequency = table(Temp))


#---------------- covariance ------------------



# x-incr,y-incr ==> high covariance
x = c(10,11,13,16,20)
y = c(56.1,57.2,59.4,60.1,65.2)

cov(x,y)



# x-incr,y-decr ==> low covariance
x = c(10,11,13,16,20)
y = c(14.7,14.1,13.9,13.4,12.3)

cov(x,y)



# x-decr,y-incr ==> low covariance
x = c(20,16,13,11,10)
y = c(56.1,57.2,59.4,60.1,65.2)

cov(x,y)



# x-decr,y-decr ==> high covariance
x = c(20,16,13,11,10)
y = c(14.7,14.1,13.9,13.4,12.3)

cov(x,y)



#--------------Corelation------------------

x = round(runif(10,1,50),2)
y = round(runif(10,100,200),2)

cor(x,y)



concrete
colnames(concrete)

cor(concrete$cementcomp,concrete$water)

cor(concrete)


 
#-------------Hypothesis-------------------
#Two types:-

#1)NULL HYPOTHESIS
#2)Alternate Hypothesis

#claim:-
#  The average battery life is 4 years

#opposite clain:
#  The average bettery life is not 4 years

#t-statistics = z-calculated

#we use this in feature selection

#Examples:-

#1)when can has 12 ounces

#H0 = mean = 12
#H1 != mean != 12

#2)when can has atleast 12ounces

#H0 = mean = 12
#H1 = mean < 12

#3)the majority proportion of scl teachers in indian scl are women 

#H0 , p(proportion) = 0.5
#H1 ,p(proportion) > 0.5

#4)The mean iq is 100

#H0 , m = 100
#H1 , m != 100

#Claim and null hypothesis are not always same.

#------------------------------------------

#Question:-

#A sample of 706 companies found that 61% of CEO's were male.
#claim: Most CEO's are males
#Take significance level(alpha) as 0.05

#H0 = p = 0.5
#H1 p > 0.5
#prbability = 0.61

