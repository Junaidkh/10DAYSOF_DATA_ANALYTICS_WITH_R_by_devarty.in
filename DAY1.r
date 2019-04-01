version
# variables

firstname = 'Junaid'
firstname = "Junaid"

print(firstname)
typeof(firstname)

lastname = "Khan"
lastname = 'khan'

firstname = 1234
typeof(firstname)

#vectors

months = c('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec')

print(months)

#length of the vectors

length(months)


#elementwise access

months[1]

months[1:4]

#count the numbers of each element
nchar(months[1])


#numeric vector

numbers = c(10,18,25,67,90)
print(numbers)

typeof(numbers)

sum(numbers)


#assignment 1

#create a numeric vector 5 elements that reprsents the number of boxes in a bag
#the cost of each box is 150rs.
#find total cost of bag

bag = c(1,2,3,4,5)
cost = 150*sum(bag)
print(cost)


n1 = 10.5
print(as.integer(n1))

n1 = 300;n2 = 46

#quotient

n1%/%n2

n1%%n2



#check divisibility of a number

n1%%2 == 0


print(numbers)

#get all the even numbers from a given number
numbers[which(numbers%%2 == 0)]

#assignment 2

#create a string vector extract all 4 digit string

vec1 = c('akaf','sona','inki','pinki','tinki')
vec1[which(nchar(vec1)%%4 == 0)]

#assignment 3

#from a numeric vector, extract all 3 digit numbers

vec2 = c(123,456,8526,483256,23231,2313,856)
vec2[which(length(vec2)%%3==0)]



#vector with NULLS

#------------------

num2 = c(10,20,30,40,NA)
print(num2)
sum(num2)
sum(num2,na.rm = T)


#unique values
num3 = c(1,2,2,2,3,3,3,3,3,4,5,6,6,6,7)
print(unique(num3))


#assignment 4 
#create a numeric vector of marks (1-100/25)
#find which marks are duplicated

marks = c(1,2,5,2,6,3,5,1,2,5,2,6,2,5,12,15,48,21,4,5,2,5,1,26,1,26,9,7,97,58,85,6,85,15,25)
length(marks)
print(unique(marks))
unique(marks[which(duplicated(marks))])

#replace NA
print(num2)

num2[is.na(num2)] = 99

print(num2)


#statistical operations on vector
max(num2)
min(num2)
sum(num2)



#generating random numbers
#--------------------------------------------------

floor(99.89)
ceiling(10.77)

num5 = floor(runif(25,1,100))

#sort,rank,order

#sort
incr_order = sort(num5)
decr_order = sort(num5,decreasing = T)

incr_order
decr_order

#rank
rank(decr_order)
rank(incr_order)


#order

#Position of numbers from lowest to highest
num6 = floor(runif(6,1,20))
print(num6)
order(num6)


#without replacement
sample(1:50,10)
sample(1:2,10)#doesn't work


#strings ..cont
#-----------------------------------------

install.packages("stringr")
library(stringi)
library(stringr)

s1 = "CRS"; s2 = "Analytics" ; s3 = "Inc."
#concatenate strings
paste(s1,s2,s3)

#character separator
paste(s1,s2,s3,sep = "$")

word1 = "    learning R    "
word1 = str_trim(word1)


#Substring
letter1 = substr(word1,1,9)
print(letter1)


#find a wrd in a sentence
word_to_find = "learning"
grep(word_to_find,word1)


#find the number of occurences of a given word
print(word1)

word1 = "Learning R is very easy and very interesting"
str_count(word1,"very")

startsWith(word1,"python")
endsWith(word1,"ing")

#find all occurences of a word
grepRaw("very",word1,all = T)

#character trnslation

sentence1 = "An apple a day keeps the doctor away"
chartr("A","Z",sentence1)


#find and replace
gsub("apple","orange",sentence1)


#split a sentence into words
sent1 = "all+tiems+are+on+sale+and+available+at+attractive+discounts"

strsplit(sent1,split="+",fixed = T) 


#vector arithmetic
#---------------------------------
v1 = c(1,2,3,4,5)
v2 = c(11,12,13,14,15)

print(v1); print(v2)

v1+v2



vec1 = c(1,2,3,4,5)
vec2 = c(1,2,3,4,5,6,7)

print(vec1); print(vec2)

vec1+vec2


?'stringi' #for help on any function





##Evening


#lists
#unnamed list
educ1 = list('school','high scool','college','past grad','phd','doctorate')
typeof(educ1)
length(educ1)

#named list
educ2 = list(educ_type = list('school','high scool','college','past grad','phd','doctorate'))
print(educ1)
print(educ2)

#accessing a list
educ1[1]   #first

educ1[1:4]  #first 3

educ1[c(1,4)] #1 and 4 

educ1[length(educ1)]  #last element

educ2[1:3] #we have to write it as

#accessed named list
educ2$educ_type[1:3]
educ2$educ_type[2]

#converting list to vector
v_educ1 = unlist(educ1)

#list can contain different data types

lov = list('violet','indigo',c(1:10),TRUE,55.27)
print(lov)


lov[3]


#assignment 5

#create a list having 2 elements: each element is a list of numbers
#element 1: 25 random integers from 1 - 100
#element 2: 25 random floats from 5-100

li = list(floor(runif(25,1,100)),runif(25,5,100))
print(li)




#adding elements to list

#1)at the end of list
#2)at any position

#1)
educ1
pos = length(educ1); print(pos)
educ1[pos+1] = "M.phill"
educ1[pos+1] = "post doc"
print(educ1)

#2)
pos1 = grep("phd",educ1)
educ1 = append(educ1,c("specialization"),pos1)
print(educ1)
educ1 = replace(educ1,c("PHD"),pos1)
print(educ1)



#Checking if an element exists in a list

grep("phd",educ1)
grep("hello",educ1)



#delete items from a list

educ1[1] = NULL
print(educ1)


educ1[grep("past grad",educ1)] = NULL
print(educ1)



#MERGE LISTS

l1 = list(1,2,3)
l2 = list(11,80,10)
l3 = c(l1,l2)
print(l3)


#pre-defined lists

letters
LETTERS
month.abb
month.name


#for loop

for (e in educ1)
  print(e)


for(e in l3)
  print(e)


#assignment 6
#for the list "educ1",print the length of all the elements
#expected output
#length of <string> = <length>

for(e in educ1)
  print(paste("length of ",e," = " ,nchar(e)))





#matrix  
#-------------

num1 = floor(runif(50,1,200))
print(num1)


#matrix R=10,C=5

rows = c()
cols = c('c1','c2','c3','c4','c5')

#clumn wise
mx1 = matrix(num1,ncol = 5,dimnames = list(rows,cols))
print(mx1)

#row wise
mx2 = matrix(num1,ncol = 5,dimnames = list(rows,cols),byrow = T)
print(mx2)

#dimension of the matrix

dim(mx1)
length(mx1)



#why byrow is important?

#inventory dataset

cols = c('itemcode','itemname','itemdesc','qty','rate')
rows = c()


data1 = c('ITM001','TV','color tv',2000,110000,'ITEM0019','Camera','canon mark II',10,450000,
          'ITEM1000','Printer','HP color',21,9000)

mx_item = matrix(data1,nrow=3,byrow = T,dimnames = list(rows,cols))
print(mx_item)



#accessing the matrix

mx_item[1,1] #r1,c1
mx_item[1,]  #r1,all columns
mx_item[,1]  #all rows,1 column
mx_item[1:2,1:3] #first 2 rows and first 3 columns


# R = 3 , C= 1 and 5
mx_item[3,c(1,5)]

#matrix arithmetic













