
#---------- Sampling Techniques -------------

#--------- Visualization -----------

install.packages("ggplot2")

library(ggplot2)

sleep = read.csv("sleep.csv")

sleep1 = read.csv("sleep.csv")

sleep1$X = NULL

sleep1$gender[sleep1$Gender==0] = "m"
sleep1$gender[sleep1$Gender==1] = "f"
sleep1$gender = as.factor(sleep1$gender)


View(sleep1)

#Removing column X

sleep$X = NULL


#changing the values in gender column

str(sleep)

sleep$Gender = as.factor(sleep$Gender)

str(sleep$Gender)

sleep$Gender = factor(sleep$Gender , levels = c("0","1"),
                      labels = c("M","F")
                      )
sleep$Gender

#attaching the dataframe in the R memory so that we can access column of 
#sleep directly

attach(sleep)

#---stripchart---

stripchart(ClassYear,method = "stack",main = "Stripchart for class year",xlab = "class year")


stripchart(NumEarlyClass,method = "stack",main = "Stripchart for NumEarlyClass",xlab = "NumEarlyClass")


#---Histogram---

hist(ClassesMissed,breaks = 10,main = "ClassesMissed",col = "red")


#---BoxPlot---

boxplot(AnxietyScore,ylab = "anxietyscore",main = "anx", horizontal = T)


#---ScatterPlot---


plot(PoorSleepQuality,DepressionScore)

cor(PoorSleepQuality,DepressionScore)#it is almost highly corelated


#---Bar Chart---

barplot(DepressionScore,main = "Depr",ylab = "DepressionScore")


#----using the ggplot----

ggplot(sleep,
       aes(x = DepressionStatus,fill = DepressionStatus)
       )+geom_bar()

#aes = aesthetics - it tells us how the data looks like.


#---Horizontalplot---



sleep
#---vertical plot with geometry parameters
ggplot(sleep,aes(x = AnxietyStatus,fill=AnxietyStatus))+
  geom_bar(position = "stack")+ggtitle('Anxiety Status') +
  labs(y = "anxiety score",x = "anxiety")

ggplot(sleep,aes(x = DepressionStatus,fill=DepressionStatus))+
  geom_bar(position = "stack")+ggtitle('Depression Status') +
  labs(y = "Depression score",x = "Depression")


#---plotting 2 factor variable ---


ggplot(sleep,aes(x = DepressionStatus,fill = Gender))+geom_bar()

ggplot(sleep,aes(x = AlcoholUse,fill = Gender))+geom_bar()


#---side by side plot---

ggplot(sleep,aes(x = DepressionStatus,fill=Gender))+geom_bar(position = "dodge")



#---PieChart---

ggplot(sleep,aes(x=factor(''),
                 fill = LarkOwl))+geom_bar() +
  coord_polar(theta = 'y')

ggplot(sleep,aes(x=factor(''),
                 fill = Happiness))+geom_bar() +
  coord_polar(theta = 'y')

#---dotplot---
ggplot(sleep,aes(x = Happiness))+geom_dotplot()



#---density plot---

ggplot(sleep,aes(x=AnxietyScore))+geom_density(adjust=0.4)

#Anxiety score for male and female

ggplot(sleep,aes(x=AnxietyScore,fill = Gender))+geom_density(adjust = 0.3)


ggplot(sleep1,aes(x=AnxietyScore,fill = gender))+geom_density(adjust = 0.3)

#------------------------------------ THE END ------------------------------------------



#------------------------------ Assignment - data analysis ---------------------------------

#1) get the average of Anxietyscore,Happiness,WeekdayBed for Male and Female
#2) find who is stressed out the most - Male or Female?
#3) How many students have a GPA score of >=3.1 ?
#4) what is the relation between:
    # a) StressScore and WeekdayBed
    # b) AverageSleep and GPA

#---Answers---

#1)
nrow(sleep1)    

ansm = c()
hapm = c()
wdbm = c()
ansf = c()
hapf = c()
wdbf = c()

m = c()
f = c()

c = 0
d = 0

for(i in seq(253))
{
  if(sleep1$gender[i] == 'm')
  {
    
  }
  else
  {
    d = d+1
  }
}

m
c
d

ansm
ansf


mean(AnxietyScore)


#------------------------------ Linear Regression --------------------------------------

View(concrete)

#working on concrete dataset
















