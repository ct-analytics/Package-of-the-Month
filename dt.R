library(Lahman)
library(DT)
data(Master)

datatable(Master)
## Kind of large, lets make it a bit smaller and remove row names

datatable(head(Master,n=1000),
          rownames=F,
          options=list(
            pageLength=20
          ))

## set the default sort order by weight
### Note that first column is 0
datatable(head(Master,n=1000),
          options=list(
            order = list(list(16, 'desc'))
          ))

## drag and drop columns, show/hide columns
datatable(head(Master,n=1000),
          extensions = c('ColReorder','ColVis'),
          options = list(
            dom = 'RC<"clear">lfrtip'
          ))

## Let's combine into a single call and save this table
dt <- datatable(head(Master,n=1000),
          rownames = F,
          extensions = c('ColReorder','ColVis'),
          options = list(
            pageLength = 20,
            order = list(list(16, 'desc')),
            dom = 'RC<"clear">lfrtip'
          ))

saveWidget(dt,"DT example.html")

