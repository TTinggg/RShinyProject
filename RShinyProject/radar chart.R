# kills dataframe cleaning
Kills<-Kills[-c(24,25),]
Kills[Kills$Film=="From Russia With Love",1]<-"From Russia with Love"
Kills[Kills$Film=="The World is Not Enough",1]<- "The World Is Not Enough"
library(tidyverse)
library(fmsb)
library(RColorBrewer)
library(scales)
#create tab2 dataframe with normalized data

tab2<-right_join(cast,S007_movie,by="title") %>% 
  left_join(Kills,by=c("title"="Film")) %>% 
  transmute(actor,
              title,
              popularity=(popularity-min(popularity))/(max(popularity)-min(popularity)),
              profit=((revenue-budget)-min((revenue-budget)))/(max((revenue-budget))-min((revenue-budget))),
              violence=(Total-min(Total,na.rm = TRUE))/(max(Total,na.rm = TRUE)-min(Total,na.rm = TRUE)))

#transpose
tab2_bonds<-group_by(tab2,actor) %>% 
  summarise(Popularity=mean(popularity),
            Profit=mean(profit),
            Violence=mean(violence,na.rm=TRUE))
row.names(tab2_bonds) <- tab2_bonds$actor
tab2_bonds<-data.frame(t(tab2_bonds))
tab2_bonds<-tab2_bonds[-1,] 

tab2_bonds[] <-lapply(tab2_bonds, function(x) as.numeric(as.character(x)))





coul <- brewer.pal(10, "RdBu")
colors_in <- alpha(coul,0.3)


colors_border <- coul
radarchart( tab2_bonds, axistype=0 , maxmin=F,
            #custom polygon
            pcol=colors_border , pfcol=colors_in,plwd=3, plty=2,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
            #custom labels
            vlcex=1)
legend(2, 1, legend = rownames(tab2_bonds), col = colors_border, seg.len = 2, border = "transparent", pch = 16, lty = 1)

