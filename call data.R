
setwd("C:/Users/Jeffrey.Waring/R projects/Call logging")
df <- read.csv("Calls.csv",header=TRUE)

#calls over 316s

#total number of calls
nrow(df)

kris <- df[df$Caller=="Kris Larsen",]

#Now create a date column
kris$Date<-as.Date(paste(as.character(kris$Month),as.character(kris$Day),' ',as.character(kris$Year)),format="%B %d,%Y")
#and a weekday column
kris$Weekday<-c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", 
  "Friday", "Saturday")[as.POSIXlt(kris$Date)$wday + 1]

jenny <- df[df$Caller=="Jenny",]
#Now create a date column
jenny$Date<-as.Date(paste(as.character(jenny$Month),as.character(jenny$Day),' ',as.character(jenny$Year)),format="%B %d,%Y")
#and a weekday column
jenny$Weekday<-c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", 
                "Friday", "Saturday")[as.POSIXlt(jenny$Date)$wday + 1]

avg_call_time <- mean(df$length)

names <-unique(as.character(df$Caller))
barplot(table(df$Caller),horiz=TRUE,col="blue",main="Calls by Person",las=1)
box()

hist(kris$length,col="green",breaks = 20,main="Call Durations",xlab="[sec]")
hist(jenny$length,col="purple",add=TRUE,breaks=20)
box()

barplot(table(kris$Weekday),las=1,hori=TRUE,col="green")
barplot(table(jenny$Weekday),las=1,hori=TRUE,col="purple",add=TRUE)
box()


