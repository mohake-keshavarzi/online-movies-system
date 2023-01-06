from search import *
#testing codes
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