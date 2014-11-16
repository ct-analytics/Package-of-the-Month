library(breakpoint)
library(Lahman)

data(Master)

Master %>%
  filter(nameFirst=="David") %>%
  select(playerID,nameFirst,nameLast) %>%
  arrange(nameLast)
## ortizda01

data(Batting)

Batting %>%
  filter(playerID == "ortizda01") %>%
  select()


library(breakpoint)
