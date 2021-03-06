% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/send_email.R
\name{send_email}
\alias{send_email}
\title{Send transactional email using the sendinblue API}
\usage{
send_email(
  api.key,
  sender.name,
  sender.email,
  to,
  cc = c(),
  replyTo,
  textContent,
  subject,
  attachment.filename = c()
)
}
\arguments{
\item{api.key}{SMTP API key v3}

\item{sender.name}{Name of the sender from which the emails will be sent. Maximum allowed characters are 70.}

\item{sender.email}{Email of the sender from which the emails will be sent.}

\item{to}{List of email addresses of the recipients.}

\item{cc}{List of email addresses of the recipients in cc.}

\item{replyTo}{Email on which transactional mail recipients will be able to reply back.}

\item{textContent}{Plain Text body of the message.}

\item{subject}{Subject of the message.}

\item{attachment.filename}{List of attachments. The base64 content of the attachment along with the attachment name must be specified.}
}
\value{
HTTP response
}
\description{
https://developers.sendinblue.com/reference#sendtransacemail
}
