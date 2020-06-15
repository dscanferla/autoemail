#' Send transactional email using the sendinblue API
#'
#' @description https://developers.sendinblue.com/reference#sendtransacemail
#' @param api.key SMTP API key v3
#' @param sender.name Name of the sender from which the emails will be sent. Maximum allowed characters are 70.
#' @param sender.email Email of the sender from which the emails will be sent.
#' @param to List of email addresses of the recipients.
#' @param cc List of email addresses of the recipients in cc.
#' @param replyTo Email on which transactional mail recipients will be able to reply back.
#' @param textContent Plain Text body of the message.
#' @param subject Subject of the message.
#' @param attachment.filename List of attachments. The base64 content of the attachment along with the attachment name must be specified.
#' @return HTTP response
#' @export
send_email <- function(api.key, sender.name, sender.email, to, cc=c(), replyTo, textContent, subject, attachment.filename=c()) {

  url <- "https://api.sendinblue.com/v3/smtp/email"

  body.list <- list(
    sender = list(name=sender.name, email=sender.email),
    to = lapply(to, function(x){list("email"=x)}),
    replyTo = list(email=replyTo),
    textContent=textContent,
    subject=subject)

  if (length(cc>0))
    body.list <- append(body.list, list(cc=lapply(cc, function(x){list("email"=x)})))

  if (length(attachment.filename>0))
    body.list <- append(body.list,
                        list(attachment=lapply(attachment.filename, function(x){
                          split.name <- strsplit(x, "/")[[1]]
                          attachment.name <- split.name[length(split.name)]
                          attachment.encoding64<- base64enc::base64encode(what = x)
                          list("name"=attachment.name, "content"=attachment.encoding64)})))

  body.json <- jsonlite::toJSON(body.list, auto_unbox=TRUE)

  POST(url = url,
       body = body.json,
       add_headers(.headers = c(
         "api-key"= api.key,
         "content-type"="application/json",
         "accept"="application/json")))
}
