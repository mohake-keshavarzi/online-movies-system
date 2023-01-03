import mysql.connector
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#search by different movie attributes
#searching by name of the movie
def searchByMovieName(movieName):
    movies = []
    query = 'select * from movie where movie_name = %s'
    myCursor.execute(query,(movieName,))
    for i in myCursor:
        movies.append(i)
    return movies
#searching by year of the movie
def searchByMovieYear(publishedYear):
    movies = []
    query = 'select * from movie where year(release_date) = %s'
    myCursor.execute(query,(publishedYear,))
    for i in myCursor:
        movies.append(i)
    return movies
#searching by generes
def searchByMovieGenre(genre):
    movies = []
    query = 'select * from movie_genres natural join movie where genre = %s'
    myCursor.execute(query,(genre,))
    for i in myCursor:
        movies.append(i)
    return movies
#administartive search
#search by unique user name
def searchUserByUsername(username):
    query = 'select * from account where username = %s'
    myCursor.execute(query,(username,))
    for i in myCursor:
        account = i
        return account
#search by unique email
def searchUserByEmail(email):
    query = 'select * from account where email = %s'
    myCursor.execute(query,(email,))
    for i in myCursor:
        account = i
        return account
#test
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