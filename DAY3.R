
#-------------------------- tapply ----------------------------------------

# tapply used from groupby function

# FROM DAY2
m1 = floor(runif(20,1,100))
m2 = floor(runif(20,1,100))
m3 = floor(runif(20,1,100))

section = c(rep('a',5),rep('b',5),rep('c',5),rep('d',5))

section = sample(section)


print(m1)
print(section)

#to do "tapply" the data object need to be hetrogeneous with
#different datatypes.

#so we create a list/dataframe as the datatype.


mylist = list('english' = m1 , 'maths' = m2 , 'computers' = m3 ,
              'section' = section)

tapply(mylist$computers,mylist$section,mean)
tapply(mylist$english,mylist$section,mean)
tapply(mylist$maths,mylist$section,mean)





#----------------------------- DATA FRAME(equivalent to sql) ----------------------------------

#CONVERTING A LIST INTO A DATAFRAME

marks = data.frame(mylist)
marks


tapply(marks$computers,marks$section,mean)
tapply(mylist$english,mylist$section,mean)
tapply(mylist$maths,mylist$section,mean)

# we can apply tapply on only list and dataframe

#create table<Tablename>

#columns

#customers bnak information
#list of columns are
#custid
#name
#age
#gender
#bankbalance
#creditscore



id = seq(1,20)
age = floor(runif(20,18,70))
gender = sample(c(rep("M",10),rep("F",10)))
bankbalance = round(runif(20,100,10000000),2)
creditscore = ceiling(runif(20,300,800))
names=c()
for(i in seq(20)){
   names[i] = paste(LETTERS[ceiling(runif(1,1,26))],
                    letters[ceiling(runif(1,1,26))],
                    letters[ceiling(runif(1,1,26))],sep="")
   }
names

customer = data.frame(id,names,age,gender,bankbalance,creditscore)
customer

#no. of rows
nrow(customer)

#column names
colnames(customer)

#length of column 
length(colnames(customer))

#Description of your dataset
str(customer)

#if u want top record from your data frame
head(customer,3)


#it gives last 6 records
tail(customer)
tail(customer,3)


summary(customer)


#adding new columns to a dataframe

tel = ceiling(runif(20,7000000000,9999999999))
  
ncards = ceiling(runif(20,1,5))

tel
ncards


#method 1 to add a column

customer$telephone = tel

customer

#method 2 to add new column 
#by column binding

customer = cbind(customer,ncards)

customer
customer_new
length(colnames(customer))

x = ceiling(runif(20,7000000000,9999999999))
y = ceiling(runif(20,7000000000,9999999999))

customer = cbind(customer,x,y)
customer


#Deleting columns

customer$x = NULL
customer

#=============== ASSIGNMENT===================
#How to drop multiple columns in a one line
colnames(customer)

customer = customer[.c(9,11)]
  
  drop.terms(customer,y)
?drop.scope



#binding rows to a dataframe
#steps:
  #1)create a new data frame
  #2)join DF2 and DF1
  
  
id = seq(21,40)
age = floor(runif(20,18,80))
gender = sample(c(rep("M",11),rep("F",9)))
bankbalance = round(runif(20,100,10000000),2)
creditscore = ceiling(runif(20,300,800))
names=c()
for(i in seq(20)){
  names[i] = paste(LETTERS[ceiling(runif(1,1,26))],
                   letters[ceiling(runif(1,1,26))],
                   letters[ceiling(runif(1,1,26))],sep="")
}
names
telephone = ceiling(runif(20,7000000000,9999999999))
ncards = ceiling(runif(20,1,5))
  
#Create new data frame
  
 customer_new = data.frame(id,names,age,gender,bankbalance,creditscore,telephone,ncards)
 customer_new

  
#Combining two dataframe old one and new one
  
customer = rbind(customer,customer_new)
customer



#accessing the dataframe

customer$bankbalance[1:10]

colnames(customer)
colnames(customer_new)
str(customer)

customer$bankbalance = as.double(customer$bankbalance)

#statistical ops

mean(customer$bankbalance)
mean(customer$age)


#sort the dataframe

#SELECT * FROM CUSTOMER ORDER BY AGE DECREASING

customer[with(customer,order(age,decreasing = T)),]


#SELECT id,names,gender,age FROM CUSTOMER ORDER BY AGE DECREASING

customer[with(customer,order(age,decreasing = T)),c('id','names','gender','age')]


#SELECT id,bankbalance,creditscore FROM customer ORDER BY creditscore 
#ASCENDING ORDER

customer[with(customer,order(creditscore,decreasing = F)),
         c('id','age','bankbalance','creditscore')]



#queries on the dataframe

#SELECT # WHERE creditscore>700

customer[customer$creditscore>700,]

star_customers = customer[customer$creditscore>700,]

star_customers


#SELECT <cnames,creditscore> .... where creditscore>700

customer[customer$creditscore>700,c('names','creditscore')]

#AND condition

#Select nmae,creditscore,bankbalance  WHERE creditscore>750
#and bankbalance>50000

customer[(customer$bankbalance>50000) & (customer$creditscore>750),c('names',
        'creditscore','bankbalance') ]

str(customer)


#SELECT id,names,gender FROM customer WHERE bb>75000 or cs >750

customer[(customer$bankbalance>75000) | (customer$creditscore>750),c('id',
                                              'names','gender')]

# create a new coumn in the customer dataset called status and initialize
#it with blank

#GOLD,SILVER,PLATINUM

#platinum = bankbalance>500000,cs>700
#gold = bb(100000,500000),cs(500,700)
#silver = remaining

customer$cust_type = ""
colnames(customer)
customer

customer$cust_type[(customer$bankbalance>500000) |
                     (customer$creditscore>700)] = "platinum"
customer$cust_type[((customer$bankbalance>100000)
        & (customer$bankbalance<=500000))|((customer$creditscore>500) &
        (customer$creditscore<=700))] = "gold"
customer$cust_type[(customer$bankbalance<=100000)|(customer$creditscore<=500)] = "silver"

customer$cust_type
customer




#------------------------------- Working on Dataset ------------------------------



#reading a file from a path and covert into a dataframe

path = "C:/Users/DARKLORD/Desktop/concrete.csv"

concrete = read.csv(path,header = T)
concrete

#find how many rows and columns are there in this data

colnames(concrete)

ncol(concrete)
j = nrow(concrete)


structure(concrete)


?'structure'


head(concrete,30)

tail(concrete,30)

# 0 Check for single column

concrete$cementcomp[(concrete$cementcomp == 0)]


concrete$slag[(concrete$slag == 0)]

#0 check for whole dataset

colnames(concrete)[apply(concrete,2,function(x) any(x == 0))]



#Fitting mean value at the place of 0 in the dataframe


mnslag = mean(concrete$slag)
mnflyash = mean(concrete$flyash)
mnsuperplastisizer = mean(concrete$superplastisizer)



concrete$slag[(concrete$slag == 0)] = mnslag
concrete$flyash[(concrete$flyash == 0)] = mnflyash
concrete$superplastisizer[(concrete$superplastisizer == 0)] = 
  mnsuperplastisizer

concrete$slag

concrete

colnames(concrete)[apply(concrete,2,function(x) any(x == 0))]

#NULL check

colnames(concrete)[apply(concrete,2,function(x) any(is.null(x)))]


#BLANKS

colnames(concrete)[apply(concrete,2,function(x) any())]

#special characters




