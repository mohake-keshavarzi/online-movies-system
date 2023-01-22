#importing necessary libraries
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from search import *
#target mail is changed based on conditions
targetMail = 'allo@gmail.com'
mailContent = searchPassword(targetMail)#content is password of the target
#test
print(mailContent)
#reciever and target mails
senderMail = 'mmdspam79@gmail.com'
senderPassword = 'fshvlvsknwthnxrf'
receiverMail = 'meymani79@gmail.com'#it should be target mail here we just want to test
#Setup the MIME protocol
message = MIMEMultipart()
message['From'] = senderMail
message['To'] = receiverMail
message['Subject'] = 'YOUR PASSWORD'
#The body and the attachments for the mail
message.attach(MIMEText(mailContent, 'plain'))
#Create SMTP session for sending the mail
session = smtplib.SMTP('smtp.gmail.com', 587) #host and port
session.starttls() #enable security
session.login(senderMail, senderPassword)
text = message.as_string()
session.sendmail(senderMail, receiverMail, text)
session.quit()
print('Mail Sent')