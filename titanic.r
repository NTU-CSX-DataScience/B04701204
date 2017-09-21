titanic <- read.csv("titanic.csv")

titanic$gender <- factor(titanic$gender)

titanic$class <- factor(titanic$class)
titanic$survival <- factor(titanic$survival)

#compare survival proportions between genders
gender_survival <- table(titanic$gender, titanic$survival)
mosaicplot(gender_survival)

#clear rows with false age records
titanic_new <- subset(titanic, titanic$age != 9999)

#group ages from 0~80 with intervals of 20 and show barplot
titanic_new$age <- cut(titanic_new$age, seq(0,80,20))
barplot(table(titanic_new$age))

#observe the survival rates of different age groups
age_survival <- table(titanic_new$survival, titanic_new$age)
barplot(age_survival)

#compare survival proportions between different age groups
mosaicplot(age_survival)

