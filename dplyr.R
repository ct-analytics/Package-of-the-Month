library("dplyr")
library("Lahman")

data(Salaries)
data(Batting)
data(Fielding)
data(Master)

head(Batting)

Batting %>%
  group_by(playerID,yearID) %>%
  mutate(G_fielding = G - G_batting) %>%
  summarize(G = sum(G),
            G.fielding = sum(G_fielding),
            G.batting = sum(G_batting),
            team=paste(teamID,collapse=',')) %>%
  ungroup() %>%
  arrange(desc(G.fielding)) %>%
  filter(#yearID==2010,
         G.fielding > 0) %>%
  left_join(Fielding %>%
              group_by(playerID,yearID) %>%
              summarize(positions=paste(unique(POS),collapse=',')) %>%
              ungroup() %>%
              select(playerID,yearID,positions)) %>%
  left_join(Master %>%
              mutate(name=paste(Master$nameFirst, Master$nameLast, sep=' ')) %>%
              select(playerID,name)) %>%
  select(Name=name,Team=team,Positions=positions,Year=yearID,Games=G,
         Games.Fielding.only=G.fielding,Games.Fielding.and.Batting=G.batting) %>%
  filter(!("P" == Positions)) %>%
  slice(1:10) 


