import re
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