library("dplyr")
library("Lahman")

data(Batting)
data(Fielding)
data(Master)

Batting %>%
  group_by(playerID,yearID) %>%
  summarize(triples = sum(X3B),
            team=paste(teamID,collapse=','),
            leagues.count=n_distinct(lgID)) %>%
  ungroup() %>%
  arrange(desc(triples)) %>%
  filter(yearID==2004) %>%
  left_join(Master %>%
              mutate(name=paste(Master$nameFirst, Master$nameLast, sep=' ')) %>%
              select(playerID,name)) %>%
  select(Name=name,Team=team,Year=yearID,Triples=triples) %>%
  slice(1:5) 


