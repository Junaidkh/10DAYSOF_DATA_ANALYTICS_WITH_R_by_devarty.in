#---------------sampling techniques------------------------
install.packages("ggplot2")
library("ggplot2")

sleep=read.csv("sleep.csv")
sleep

View(sleep)

#to delete a column
sleep$X=NULL

#to make a new column according to previous column present
sleep$gender[sleep$Gender==0]="male"
sleep$gender[sleep$Gender==1]="female"
View(sleep)


sleep$gender=as.factor(sleep$gender)


attach(sleep)

#stripchart
stripchart(ClassYear,method="stack", main="stripchart
                          for ClassYear",xlab="ClassYear")


#HISTOGRAM
hist(GPA,breaks = 6,main = "GPA",col="red")
hist(ClassesMissed,breaks = 6,main = "ClassesMissed",col=
                                                  "pink")

#boxplot
boxplot(AnxietyScore , horizontal = T)

#scatter plot
plot(PoorSleepQuality,DepressionScore)

cor(PoorSleepQuality,DepressionScore)#it is almost
                                         #highly co related

#barchart
barplot(DepressionScore,main = "Depr score")


#now using the ggplot
ggplot(sleep,aes(x=DepressionStatus,fill=DepressionStatus))
                                       +geom_bar()
#aes=astethics(look and field)
#geom=geometry


#horizontal plot
ggplot(sleep,aes(x=AnxietyStatus,fill=AnxietyStatus))+
  geom_bar(position = "stack")+
  ggtitle('anxietystatus')+ 
  labs(y="anxietyscore", x="anxiety")

   
#plotting 2 factor variables
ggplot(sleep,aes(x=DepressionStatus,fill=gender))+geom_bar()



ggplot(sleep,aes(x=AlcoholUse,fill=gender))+geom_bar()


#SIDE BY SIDE PLOT
ggplot(sleep,aes(DepressionStatus,fill=gender))+geom_bar(position="dodge")


#piechart
str(Happiness)

ggplot(sleep,aes(x=factor(''),fill=LarkOwl))+geom_bar()+coord_polar(theta = "y")


#dot plot
ggplot(sleep,aes(x=Happiness))+geom_dotplot()


#densityplot
ggplot(sleep,aes(x=AnxietyScore))+geom_density(adjust=1)


#anxiety score for m/f
ggplot(sleep,aes(x=AnxietyScore,fill=gender))+geom_density(adjust=0.3)


#-----------------end  







#assignment1-data analysis

# get the average of anxietyscore,happiness,weekdaybed for
                                     # male and female.
#find who is stressed out the most males and females?
#how many student have a gpa score of >=3.1
#what is the relation between
   #stressscore and weekdaybed
  #averagesleep and gpa 


#---------------------3.asig---------------------------
v=sleep$GPA
print(v)
c = 0
for(i in seq(253))
{
  if(v[i]>3.5)
  {
    print(v[i])
    c = c+1
    }
  
      
}
c


#-----------------4.assig-------------------------------





cars

View(cars)













