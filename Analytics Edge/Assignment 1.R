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

#Read Files
ibm=read.csv("Data Files/IBMStock.csv")
ge=read.csv("Data Files/GEStock.csv")
pg=read.csv("Data Files/ProcterGambleStock.csv")
cola=read.csv("Data Files/CocaColaStock.csv")
boeing=read.csv("Data Files/BoeingStock.csv")

#Change the date format
ibm$Date = as.Date(ibm$Date, "%m/%d/%y")
cola$Date = as.Date(cola$Date, "%m/%d/%y")
ge$Date = as.Date(ge$Date, "%m/%d/%y")
pg$Date = as.Date(pg$Date, "%m/%d/%y")
boeing$Date = as.Date(boeing$Date, "%m/%d/%y")

tail(boeing$Date,1) #print the last date
summary(ibm)
mean(ibm)
which.max(cola$StockPrice) #Maximum stock price of cola 
sd(pg$StockPrice) #Standard deviation of the stock price for PG

plot(cola$Date,cola$StockPrice,type = "l") #Plot Date on X and Stock price on Y axis wrt CocoCola, type l means line graph

lines(pg$Date,pg$StockPrice,col="blue") #Add line graph for PG on the plot with colour blue
abline(v=as.Date(c("2000-03-01")), lwd=2) #Draw a line ||el to Y on given date
plot(cola$Date,cola$StockPrice,type = "l",col="red")
lines(pg$Date,pg$StockPrice,col="blue")
plot(cola$Date[301:432], cola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(pg$Date[301:432], pg$StockPrice[301:432], type="l", col="blue")
lines(ge$Date[301:432], ge$StockPrice[301:432], type="l", col="green")
lines(ibm$Date[301:432], ibm$StockPrice[301:432], type="l", col="orange")
lines(boeing$Date[301:432], boeing$StockPrice[301:432], type="l", lty=3) #ty=3 gives a dotted line

t1=tapply(ibm$StockPrice,months(ibm$Date),mean) #Table with mean stock price acc to month
t2=tapply(ge$StockPrice,months(ge$Date),mean)
t3=tapply(pg$StockPrice,months(pg$Date),mean)
t4=tapply(boeing$StockPrice,months(boeing$Date),mean)
t5=tapply(cola$StockPrice,months(cola$Date),mean)

#Demographics

CPS=read.csv("Data Files/CPSData.csv") 
tapply( cps$Country!="United States",cps$MetroArea=="New York-Northern New Jersey-Long Island, NY-NJ-PA",mean,na.rm=TRUE)
sort(tapply( cps$Country=="Somalia",cps$MetroArea,sum,na.rm=TRUE))