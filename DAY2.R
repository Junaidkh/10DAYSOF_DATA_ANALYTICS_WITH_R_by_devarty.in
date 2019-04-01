
# R = 3 , C= 1 and 5
mx_item[3,c(1,5)]



#-----------------------------Assignments-----------------------------------------



#1)500 samples of scrap metals are collected whose weights range from 5 to 5000g.
#group the sample in the following format :
#group1 - weight between 5-9 
#group2-weights between 10-99
#group3-weights between 100-999
#group4-weight>1000


#2)A sample of 200 employee data of emails shows 10 duplicated values .
#create a script to identify the duplicated values & fix them in any way so that the email
#data contains 200 unique values.


#3)55 samples of dimension(Length,Breadth,Thckness) are recorded of different objects.
#The Observation have the following rules:
#L->float->between 1-100
#B->float->between 1-30
#T->float->between 1-3
#create a named list to store these values.


#1)

samples = floor(runif(500,5,5000))
i = 0
for(i in samples)
{
  if(i %in% seq(5,9))
    print("group 1")
  else if(i %in% seq(10,99))
    print("group 2")
  else if(i %in% seq(100,999))
    print("group 3")
  else
    print("group 4")
  i = i+1
}

#2)

emails = list('@yahoo.com','@gmail.com','@kec.in','@reddit.com',
              '@hotmail.com','@goplay.com','@timesmail.com','@college.in',
              '@mycollege.edu','@yourmail.in')
rep("junaid",50)

#do this for 200 names

names = c(
          rep('name1',50),
          rep('name2',50),
          rep('name3',50),
          rep('name4',50)
)
length(names)
names = sample(names)
names

email = sample(emails)
email
for(i in names)
{
  m = paste(names,emails)
}
m
dup = m[which(duplicated(m))]
dup
spl = strsplit(dup,split='@',fixed = T)
for(i in dup)
{
  split1 = strsplit(i,split = ' ',fixed = T)[1]
  print(split1)
}
split1







#------------------------------Matrix arithmetic Continue.....---------------------------
#------------------------------------

range1 = runif(20,1,100)
range2 = runif(20,5,10)

mx1 = matrix(range1,nrow = 4)
mx2 = matrix(range2,nrow = 4)

print(mx1)
print(mx2)


#matrix addition
mx_add = mx1+mx2


#matrix subtraction

mx_sub = mx1-mx2
print(mx_sub)

# Truncating or limiting decimal places
mx1 = round(mx1,2)
mx2 = round(mx2,2)
mx1[1,] #showing only first row

#matrix multiplication

round(mx1*mx2,2)



#matrix division

round(mx1/mx2,3)




#-------------------------------Apply function-----------------------------------

#row wise = 1 , coulmn wise = 2

print(mx1)

#row-wise total
apply(mx1,1,sum)
apply(mx1,1,mean)   #row wise average

#column-wise total
apply(mx1,2,sum)

apply(mx1,2,mean)



#Assignment-2
#create a matrix of marks of 50 students for 3 subjects.
#calculate the total and average of the student.

stud = floor(runif(150,1,100))
cols = c('stud1','stud2','stud3')
rows = c()
stud = matrix(stud,ncol = 3,dimnames = list(rows,cols),byrow = T)
print(stud)
stud

stud[,1]

apply(stud,1,sum)
apply(stud,2,sum)
avg = apply(stud,1,mean)
apply(stud,2,mean)



#--------------------------------if-else loops---------------------------------

#---------------

age = 18
status = 'A'

if(age>18)
  print("adult") else
  print("not an adult")


#AND condition
if ((age>18) & (status == 'A'))
  print('active')  else
  print('inactive')

#OR condition
if ( (age>18) | (status == 'A'))
  print('active') else
  print('inactive')    



#----------------------------------if-else--------------------------------------
if(age == 18)
  print("18") else if
  (age == 19)
    print("19") else
      print('invalid age')


#check for a range in "if"

weight = 55
if(weight %in% seq(55,65))
  print("normal weight") else
    print("not normal weight")


#---------------------------------FOR LOOPS------------------------------------------------------
#---------------

list1 = list('a','b','c','d','e')
for (e in list1)
  print(e)


#ASSIGNMENT
#using the marks matrix of student grade each student according to the average
#avg>90 ->excellent
#avg(79.9 - 89.9)->"V.good"
#avg(65.9 - 79.9)->"good"
#avg(59.9 - 65.9)->"average"
#avg(<50)->"poor"
i = 1
for (e in avg)
{
  if(e>90)
    print(paste(i,e," = Excellent")) 
  else if ((e>79.9) & (e<=89.9))
    print(paste(i,e," = V.good")) 
  else if ((e>65.9) & (e<=79.9))
      print(paste(i,e," = good")) 
  else if ((e>50.9) & (e<=65.9))
        print(paste(i,e," = average")) 
  else
        print(paste(i,e," = poor"))   
  
  i=i+1
}
      
lov = runif(50,1,100)
print(lov)
for(e in lov)
{
  print(e)
}

e = 81
if(79.9< e <=89.9)
  print("pass") else
    print("fail")
#-------------------------------while loop------------------------------------------

i = 10
while(i>2)
{
  print(i)
  i = i-1
}

#---------------------------------REPEAT LOOP---------------------------------
i = 10
repeat
{
  print(i)
  i = i-1
  if(i<2)
    break
}


#------------------------------Functons in R----------------------------------

calcprice = function(bp,oc,t,d)
{
  totalprice = bp + oc
  #apply discount
  totalprice = totalprice - ((d/100)*totalprice)
  
  #apply tax
  totalprice = totalprice + ((t/100)*totalprice)
  
  return(totalprice)
}

p = calcprice(10000,1500,10,5)
p
print(p)

#named parameters
p = calcprice(d=5,t = 10,oc = 1500,bp = 10000)
p

#optional parameters in a function

calcprice1 = function(bp,oc = 1500,t = 10,d = 5)
{
  totalprice = bp + oc
  #apply discount
  totalprice = totalprice - ((d/100)*totalprice)
  
  #apply tax
  totalprice = totalprice + ((t/100)*totalprice)
  
  return(totalprice)
}

r = calcprice1(bp = 10000)
r

#assignment 2

fix = function(names1,emails1)
{
  m1 = paste(names1,emails1)
  m1
}

fix(names,email)


#-----------------------------Apply functions----------------------------------



#---------------------


radius = matrix(round(runif(9,1,5),1),nrow = 3)
radius

areaofcircle = function(r)
{
  return(pi*r*r)
}

area_of_circles = apply(radius,1,areaofcircle)
area_of_circles = round(area_of_circles,2)
area_of_circles


#================================lapply===============================================

# it returns a list

words = c("apple","computer","dog","catalysts","furniture","R")

#find the length of each word in the vector
lapply(words, nchar)

nchar(words)

#=========================  sapply (simplified output)  ===============================

sapply(words,nchar)

?'sapply'


#=========================  tapply ==========================================

m1 = floor(runif(20,1,100))
m2 = floor(runif(20,1,100))
m3 = floor(runif(20,1,100))

section = c(rep('a',5),rep('b',5),rep('c',5),rep('d',5))

section = sample(section)
length(section)

cols = c('m1','m2','m3','section')
rows = c()
mx1 = matrix(c(m1,m2,m3,section),byrow = F,ncol = 4,dimnames = list(rows,cols))
mx1


a = "23"
sapply(a,as.integer)




as.integer(a)





#create a function called "halfmarks" return-> x/2 
#using this function return all the
#half marks for the 3 subjects that we created in the matrix 



halfmarks = function()