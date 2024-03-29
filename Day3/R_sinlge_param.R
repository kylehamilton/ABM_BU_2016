library(ggplot2)
library(reshape)
d<-read.csv("C:/Users/bpo/Desktop/github/ABM_BU_2016/Day3/Fire_behaviour_space_edit experiment_density-table.csv",skip=6)
names(d)<-c("run","density","step","burned")
d$burned <- as.numeric(d$burned)
d1<-melt(d,m="burned")
d2<-cast(d1,run+density~variable,max)
g0<-ggplot(data=d2,aes(y=burned,x=density))
g0+geom_point()+geom_smooth()
savehistory("C:/Users/bpo/Desktop/github/ABM_BU_2016/Day3/R_single_param.Rhistory")

d<-read.csv("Virus experiment-table.csv",skip=6)
names(d)<-c("run","duration","recover","infect","step","npeople")
g0<-ggplot(data=d,aes(x=step,y=npeople))
g0+geom_line()+facet_grid(infect~duration)
d1<-melt(d,m="npeople")
d2<-cast(d1,duration+infect~variable,min)
g0 <- ggplot(d2, aes(duration, infect)) 
g1 <- g0 + geom_tile(aes(fill = npeople), colour = "white")
g1 + scale_fill_gradient(low = "white",high = "darkred")
