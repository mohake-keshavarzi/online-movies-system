from search import *
from loginPageFunctions import *
#testing codes
#testing search functions
print('movie name')
movies = searchByMovieName('lost in the wood')
for i in movies:
    print(i)
print('-----------------------------------------------')
print('movie year')
movies = searchByMovieYear('2016')
for i in movies:
    print(i)
print('-----------------------------------------------')
print('movie genre')
movies = searchByMovieGenre('Action')
for i in movies:
    print(i)
print('-----------------------------------------------')
print('administrative search:')
account1 = searchUserByUsername('GHOST')
print('search by username:',account1)
account2 = searchUserByEmail('allo@gmail.com')
print('search by eamil:',account2)
print('-----------------------------------------------')
print('search password by email')
password = searchPassword('allo@gmail.com')
print(password)
#testing login page functions
print('-----------------------------------------------')
print('password check')
print(checkPasswordValidity('1234'),checkPasswordValidity('idgf78f2gfwifgi'))
print('email check')
print(checkEmailValidity('mmd@aut.ac.ir'),checkEmailValidity('avdya@ahvcd'))