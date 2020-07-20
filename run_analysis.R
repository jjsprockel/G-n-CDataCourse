install.packages("dplyr")
install.packages("matrixStats")

library(dplyr)
library(matrixStats)

##archivos de entrenamiento
filedir1train<- "./UCI HAR Dataset/train/subject_train.txt"
filedir2train<- "./UCI HAR Dataset/train/X_train.txt"
filedir3train<- "./UCI HAR Dataset/train/y_train.txt"
filedir4train<- "./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"
filedir5train<- "./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"
filedir6train<- "./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"
filedir7train<- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
filedir8train<- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
filedir9train<- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
filedir10train<- "./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
filedir11train<- "./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
filedir12train<- "./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"

##archivos de pruebas
filedir1test<- "./UCI HAR Dataset/test/subject_test.txt"
filedir2test<- "./UCI HAR Dataset/test/X_test.txt"
filedir3test<- "./UCI HAR Dataset/test/y_test.txt"
filedir4test<- "./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"
filedir5test<- "./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"
filedir6test<- "./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"
filedir7test<- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"
filedir8test<- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"
filedir9test<- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"
filedir10test<- "./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"
filedir11test<- "./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"
filedir12test<- "./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"

##descargar archivos

data1train <- read.table (filedir1train, header = FALSE, stringsAsFactors = FALSE, col.names= "subject")
data2train <- read.table (filedir2train)
data3train <- read.table (filedir3train, col.names= "activity")
data4train <- read.table (filedir4train)
data5train <- read.table (filedir5train)
data6train <- read.table (filedir6train)
data7train <- read.table (filedir7train)
data8train <- read.table (filedir8train)
data9train <- read.table (filedir9train)
data10train <- read.table (filedir10train)
data11train <- read.table (filedir11train)
data12train <- read.table (filedir12train)

data1test <- read.table (filedir1test, header = FALSE, stringsAsFactors = FALSE, col.names= "subject")
data2test <- read.table (filedir2test)
data3test <- read.table (filedir3test, col.names= "activity")
data4test <- read.table (filedir4test)
data5test <- read.table (filedir5test)
data6test <- read.table (filedir6test)
data7test <- read.table (filedir7test)
data8test <- read.table (filedir8test)
data9test <- read.table (filedir9test)
data10test <- read.table (filedir10test)
data11test <- read.table (filedir11test)
data12test <- read.table (filedir12test)

##cambiamos los nombres de las actividades

z<- vector(mode="character", length (data3test))
for (i in 1:nrow(data3test)){
  if(data3test[i,1]==1){z[i]<-"WALKING"}
  if(data3test[i,1]==2){z[i]<-"WALKING_UPSTAIRS"}
  if(data3test[i,1]==3){z[i]<-"WALKING_DOWNSTAIRS"}
  if(data3test[i,1]==4){z[i]<-"SITTING"}
  if(data3test[i,1]==5){z[i]<-"STANDING"}
  if(data3test[i,1]==6){z[i]<-"LAYING"}
}

w<- vector(mode="character", length (data3train))
for (i in 1:nrow(data3train)){
  if(data3train[i,1]==1){w[i]<-"WALKING"}
  if(data3train[i,1]==2){w[i]<-"WALKING_UPSTAIRS"}
  if(data3train[i,1]==3){w[i]<-"WALKING_DOWNSTAIRS"}
  if(data3train[i,1]==4){w[i]<-"SITTING"}
  if(data3train[i,1]==5){w[i]<-"STANDING"}
  if(data3train[i,1]==6){w[i]<-"LAYING"}
}

##obtenemos los promedios de las diferentes mediciones (media y desv estandar)

valor<-names(data2test)
data2test<- data2test%>%
  mutate( promediox = rowMeans(.[valor]), stdevx=rowSds(as.matrix(.[valor])))
data2train<- data2train%>%
  mutate( promediox = rowMeans(.[valor]), stdevx=rowSds(as.matrix(.[valor])))

valor<-names(data4test)

#aceleracion en x,y, z
data4test<- data4test%>%
  mutate( promedioaccx = rowMeans(.[valor]), stdevaccx=rowSds(as.matrix(.[valor])))
data4train<- data4train%>%
  mutate( promedioaccx = rowMeans(.[valor]), stdevaccx=rowSds(as.matrix(.[valor])))

data5test<- data5test%>%
  mutate( promedioaccy = rowMeans(.[valor]), stdevaccy=rowSds(as.matrix(.[valor])))
data5train<- data5train%>%
  mutate( promedioaccy = rowMeans(.[valor]), stdevaccy=rowSds(as.matrix(.[valor])))

data6test<- data6test%>%
  mutate( promedioaccz = rowMeans(.[valor]), stdevaccz=rowSds(as.matrix(.[valor])))
data6train<- data6train%>%
  mutate( promedioaccz = rowMeans(.[valor]), stdevaccz=rowSds(as.matrix(.[valor])))

#gyro en x,y, z
data7test<- data7test%>%
  mutate( promediogyrox = rowMeans(.[valor]), stdevgyrox=rowSds(as.matrix(.[valor])))
data7train<- data7train%>%
  mutate( promediogyrox = rowMeans(.[valor]), stdevgyrox=rowSds(as.matrix(.[valor])))

data8test<- data8test%>%
  mutate( promediogyroy = rowMeans(.[valor]), stdevgyroy=rowSds(as.matrix(.[valor])))
data8train<- data8train%>%
  mutate( promediogyroy = rowMeans(.[valor]), stdevgyroy=rowSds(as.matrix(.[valor])))

data9test<- data9test%>%
  mutate( promediogyroz = rowMeans(.[valor]), stdevgyroz=rowSds(as.matrix(.[valor])))
data9train<- data9train%>%
  mutate( promediogyroz = rowMeans(.[valor]), stdevgyroz=rowSds(as.matrix(.[valor])))

#
data10test<- data10test%>%
  mutate( promediototaccx = rowMeans(.[valor]), stdevtotaccx=rowSds(as.matrix(.[valor])))
data10train<- data10train%>%
  mutate( promediototaccx = rowMeans(.[valor]), stdevtotaccx=rowSds(as.matrix(.[valor])))

data11test<- data11test%>%
  mutate( promediototaccy = rowMeans(.[valor]), stdevtotaccy=rowSds(as.matrix(.[valor])))
data11train<- data11train%>%
  mutate( promediototaccy = rowMeans(.[valor]), stdevtotaccy=rowSds(as.matrix(.[valor])))

data12test<- data12test%>%
  mutate( promediototaccz = rowMeans(.[valor]), stdevtotaccz=rowSds(as.matrix(.[valor])))
data12train<- data12train%>%
  mutate( promediototaccz = rowMeans(.[valor]), stdevtotaccz=rowSds(as.matrix(.[valor])))

##creamos las bases de datos de entrenemiento y de pruebas
test<- cbind(data1test, z, data2test$promediox, data2test$stdevx, data4test$promedioaccx, data4test$stdevaccx,
             data5test$promedioaccy, data5test$stdevaccy, data6test$promedioaccz, data6test$stdevaccz,
             data7test$promediogyrox, data7test$stdevgyrox, data8test$promediogyroy, data8test$stdevgyroy,
             data9test$promediogyroz, data9test$stdevgyroz, data10test$promediototaccx, data10test$stdevtotaccx,
             data11test$promediototaccy, data11test$stdevtotaccy, data12test$promediototaccz, data12test$stdevtotaccz)
train<- cbind(data1train, w, data2train$promediox, data2train$stdevx, data4train$promedioaccx, data4train$stdevaccx,
              data5train$promedioaccy, data5train$stdevaccy, data6train$promedioaccz, data6train$stdevaccz,
              data7train$promediogyrox, data7train$stdevgyrox, data8train$promediogyroy, data8train$stdevgyroy,
              data9train$promediogyroz, data9train$stdevgyroz, data10train$promediototaccx, data10train$stdevtotaccx,
              data11train$promediototaccy, data11train$stdevtotaccy, data12train$promediototaccz, data12train$stdevtotaccz)


##cambiamos por nombres significativos
names(test)<- c("subject", "activity", "meanx","stdevx", "meanaccx", "stdevaccx", "meanacy", "stdevaccy",
                "meanaccz", "stdevaccz", "meangyrox", "stdevgyrox", "meangyroy", "stdevgyroy",
                "meangyroz", "stdevgyroz", "meantotaccx", "stdevtotaccx", "meantotacy", "stdevtotaccy",
                "meantotaccz", "stdevtotaccz")
names(train)<- c("subject", "activity", "meanx","stdevx", "meanaccx", "stdevaccx", "meanacy", "stdevaccy",
                 "meanaccz", "stdevaccz", "meangyrox", "stdevgyrox", "meangyroy", "stdevgyroy",
                 "meangyroz", "stdevgyroz", "meantotaccx", "stdevtotaccx", "meantotacy", "stdevtotaccy",
                 "meantotaccz", "stdevtotaccz")


##unimos las dos bases en una sola
data_set<- rbind(test, train)

write.csv(data_set, file = "finaltable.csv", row.names = TRUE)


#Creamos una nueva tabla donde se sacan los promedios agrupados por actividad y por individuo

data_set_byactivity<- data_set%>%
  group_by(activity) %>%
  summarise(meanx= mean(meanx),stdevx= mean(stdevx), meanaccx= mean(meanaccx), stdevaccx= mean(stdevaccx),
            meanacy= mean(meanacy), stdevaccy= mean(stdevaccy), meanaccz = mean(meanaccz), 
            stdevaccz= mean(stdevaccz), meangyrox= mean(meangyrox), stdevgyrox= mean(stdevgyrox), 
            meangyroy= mean(meangyroy), stdevgyroy= mean(stdevgyroy),meangyroz= mean(meangyroz), 
            stdevgyroz= mean(stdevgyroz), meantotaccx= mean(meantotaccx), stdevtotaccx = mean(stdevtotaccx),
            meantotacy= mean(meantotacy), stdevtotaccy= mean(stdevtotaccy), meantotaccz= mean(meantotaccz),
            stdevtotaccz= mean (stdevtotaccz))

data_set_bysubject<- data_set%>%
  group_by(subject)%>%
  summarise(meanx= mean(meanx),stdevx= mean(stdevx), meanaccx= mean(meanaccx), stdevaccx= mean(stdevaccx),
            meanacy= mean(meanacy), stdevaccy= mean(stdevaccy), meanaccz = mean(meanaccz), 
            stdevaccz= mean(stdevaccz), meangyrox= mean(meangyrox), stdevgyrox= mean(stdevgyrox), 
            meangyroy= mean(meangyroy), stdevgyroy= mean(stdevgyroy),meangyroz= mean(meangyroz), 
            stdevgyroz= mean(stdevgyroz), meantotaccx= mean(meantotaccx), stdevtotaccx = mean(stdevtotaccx),
            meantotacy= mean(meantotacy), stdevtotaccy= mean(stdevtotaccy), meantotaccz= mean(meantotaccz),
            stdevtotaccz= mean (stdevtotaccz))

##se cambia el nombre de la primera columna
names(data_set_byactivity)[1]<- "activity_subject"
names(data_set_bysubject)[1]<- "activity_subject"


## se funden las dos tablas en una sola

byactivity_subject<- rbind(data_set_byactivity, data_set_bysubject)

write.csv(byactivity_subject, file = "summarytidytable.csv", row.names = TRUE)
