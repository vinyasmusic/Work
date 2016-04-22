#Analytical Detective
mvt=read.csv("Data Files/mvtWeek1.csv") #Read file
nrow(mvt) #Number of entries
ncol(mvt) #number of variables
summary(mvt) #Summary of all variables in the data file
max(mvt$ID) #Max value present in ID field
min(mvt$Beat) #Min value of Beat 
nrow(subset(mvt,mvt$Arrest==TRUE)) #Number of entries with Arrest as True
nrow(subset(mvt,mvt$LocationDescription=="ALLEY")) #Number of entries with arrest local as ALLEY
mvt$Date[1] #to find out the format of date used in the data
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M")) #To convert the date format
summary(DateConvert) #Summary of converted date field
#Another solution for Row 7 is 
table(mvt$Arrest)
which.min(table(mvt$Month)) #Month in which there are least thefts
which.max(table(mvt$Weekday)) #Weekday in which there are max thefts
pr=table(mvt$Year,mvt$Arrest)
pr1<-pr[,2]/(pr[,1]+pr[,2])
top5=subset(mvt,mvt$LocationDescription!="OTHER")
top5=table(top5$LocationDescription)
top5=tail(sort(top5),5)
sum(top5)
#This method retains only Location field with their values 
#Alternate way of doing Steps 19-21
TOP5 = subset(mvt,mvt$LocationDescription == "STREET" |mvt$LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)"|mvt$LocationDescription =="ALLEY"|mvt$LocationDescription =="GAS STATION"|mvt$LocationDescription =="DRIVEWAY - RESIDENTIAL")
#Above method retains other fields
table(TOP5$LocationDescription,TOP5$Weekday)


#Stock Dynamics
