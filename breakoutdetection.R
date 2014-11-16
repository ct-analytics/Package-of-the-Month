library(Lahman)
library(dplyr)
data(Master)

Master %>%
  filter(nameFirst=="David") %>%
  select(playerID,nameFirst,nameLast) %>%
  arrange(nameLast)
## ortizda01

data(Batting)

david.ortiz.ab <- Batting %>%
  filter(playerID == "ortizda01") %>%
  mutate(timestamp=as.POSIXct(paste(yearID,"01","01",sep="-"), origin = "1960-01-01")) %>%
  select(timestamp,count=AB)

library(BreakoutDetection)

d.ortiz.ab.breakout <- breakout(david.ortiz.ab,
                                min.size=2,
                                method="multi",
                                degree=1,
                                plot=T)
d.ortiz.ab.breakout
d.ortiz.ab.breakout$plot
