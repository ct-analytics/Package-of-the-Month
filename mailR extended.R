library(mailR)

rmarkdown::render("davidortiz.Rmd")

send.mail(from="feasible.analytics@gmail.com",
          to="feasible.analytics@gmail.com",
          subject="David Ortiz Statistics",
          body="davidortiz.html",
          html=T,
          inline=T,
          smtp=list(host.name = "smtp.gmail.com", 
                    port = 465, 
                    user.name = "feasible.analytics", 
                    passwd = "GOredsox", 
                    ssl = T),
          authenticate=T,
          attach.files="mailR.R")
