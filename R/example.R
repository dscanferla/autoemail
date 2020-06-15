library(httr)
source("./R/send_email.R")

# specify your sendinblue SMTP API v3
api.key <- "xkeysib-xxxxx"

# Example 1: send email to 1 recipient with no attachment
send_email(api.key = api.key,
           sender.name = "<sender-name>",
           sender.email = "<sender-email>",
           to = c("<recipient-email>"),
           replyTo = "<replyTo-email>",
           textContent = "Hi there.",
           subject = "This is the subject")

# Example 2: send email to 2 recipients, 1 CC, and 2 attachments
send_email(api.key = api.key,
           sender.name = "<sender-name>",
           sender.email = "<sender-email>",
           to = c("<recipient1-email>", "<recipient2-email>"),
           cc = c("<cc-email>"),
           replyTo = "<replyTo-email>",
           textContent = "Hi there.",
           subject = "This is the subject",
           attachment.filename = c("./test/file1.xlsx", "./test/file2.xlsx"))

