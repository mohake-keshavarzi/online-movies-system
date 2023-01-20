import re
import mysql.connector
from datetime import datetime
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#functions below is for login page including register,email validity and etc
def checkEmailValidity(email):
    expression = '[a-zA-Z]+@[a-zA-z]+\.[a-zA-z]+'
    if re.match(expression, email) == None:
       return False
    return True
def checkPasswordValidity(password):
    if len(password) >= 8:
        return True
    return False
#search for repetitive username or email
def isNewAccount(username,email):
    accounts = []
    query = 'select * from account where username = %s or email = %s'
    myCursor.execute(query,(username,email))
    for i in myCursor:
        accounts.append(i)
    if len(accounts) == 0:
        return True
    return False
#user sign in 
def signIn(username,password,email):
    message = ''
    if not checkEmailValidity(email):
        message = 'invalid email format'
        return false
    if not checkPasswordValidity(password):
        message = 'password length is not enough'
        return false
    if isNewAccount(username, email):
        message = 'email or username already taken'
        return false
    query = 'insert into account (username,password,email,joined_date,membership,membership_time) values (%s,%s,%s,%s,%s,%s)'
    myCursor.execute(query,(username,passwor,email,datetime.now(),b'0',None))
    message = 'account created successfully'
    onlineMoviesDB.commit()
    return True
def signUp(username,password):
    account = None
    message = ''
    query = 'select * from account where username = %s and password = %s'
    myCursor.execute(query,(username,password))
    for i in myCusor:
        account = i
        break
    if account == None:
        message = 'invalid credintionals'
        return None
    message = 'successful login'
    return account
    
        
    