library(xts)
library(Lahman)
library(dygraphs)
library(dplyr)
library(lubridate)

#Get David Ortiz's ID
data("Master")
david.ortiz <- Master %>% filter(nameFirst=="David",nameLast=="Ortiz") %>% select(playerID) %>% as.character

#Get his hitting data
do <- Batting %>%
  filter(playerID==david.ortiz) %>%
  arrange(yearID) 

do.xts <- xts(x=do$HR,order.by=ymd(paste(do$yearID,"11","01",sep="-")))

#Create the plot
dygraph(df.xts)

#Add in a time selector
dygraph(df.xts) %>% dyRangeSelector()

#Adjust the label
dygraph(df.xts) %>% dyRangeSelector() %>% dySeries("V1", label = "David Ortiz") 

#Remove verticle lines
dygraph(df.xts) %>% dyRangeSelector() %>% dySeries("V1", label = "David Ortiz") %>%
dyAxis("x", drawGrid = FALSE)

#Fill in the graph
dygraph(df.xts) %>% dyRangeSelector() %>% dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4)

#Add markers
dygraph(df.xts) %>% dyRangeSelector() %>% dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2)

#Add in Y axis label
dygraph(df.xts) %>% 
  dyRangeSelector() %>% 
  dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label="Homeruns") %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2)

#Add in event for traded
dygraph(df.xts) %>% 
  dyRangeSelector() %>% 
  dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label="Homeruns") %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2) %>%
  dyEvent(date = "2003-01-22", "Signed with the Red Sox", labelLoc = "top")

#Preselect only years he played for the redsox
dygraph(df.xts) %>% 
  dyRangeSelector(dateWindow = c("2003-01-23", "2014-11-01")) %>% 
  dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label="Homeruns") %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2) %>%
  dyEvent(date = "2003-01-22", "Signed with the Red Sox", labelLoc = "top")

#Annotate on all star game appearances
dygraph(df.xts) %>% 
  dyRangeSelector(dateWindow = c("2003-01-23", "2014-11-01")) %>% 
  dySeries("V1", label = "David Ortiz") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label="Homeruns") %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2) %>%
  dyAnnotation("2004-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2005-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2006-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2007-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2008-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2010-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2011-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2012-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyAnnotation("2013-11-01", text="AS", tooltip="All Star Game Appearance") %>%
  dyEvent(date = "2003-01-22", "Signed with the Red Sox", labelLoc = "top")

#Let's add in another player
albert.pujols <- Master %>% filter(nameFirst=="Albert",nameLast=="Pujols") %>% select(playerID) %>% as.character
ap <- Batting %>%
  filter(playerID==albert.pujols) %>%
  arrange(yearID) 
ap.xts <- xts(x=ap$HR,order.by=ymd(paste(ap$yearID,"11","01",sep="-")))

dygraph(cbind(df.xts,ap.xts)) %>% 
  dyRangeSelector(dateWindow = c("2003-01-23", "2014-11-01")) %>% 
  dySeries("..1", label = "David Ortiz") %>%
  dySeries("..2", label = "Albert Pujols") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label="Homeruns") %>%
  dyOptions(fillGraph = TRUE, fillAlpha = 0.4,drawPoints = TRUE, pointSize = 2) %>%
  dyLegend(labelsSeparateLines = T)
