library(mailR)

send.mail(from="feasible.analytics@gmail.com",
          to="feasible.analytics@gmail.com",
          subect="test email from R",
          body="This is a test email to attach a file for review.",
          html=T,
          smtp=list(host.name = "smtp.gmail.com", 
                    port = 465, 
                    user.name = "feasible.analytics", 
                    passwd = "XXXXX", 
                    ssl = T),
          authenticate=T,
          attach.files="mailR.R")
