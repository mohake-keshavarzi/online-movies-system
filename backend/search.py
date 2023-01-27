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
#searching by actor id
def searchByActorID(actorID):
    movies = []
    query = "select movie_name,release_date,url from movie natural join movie_actors where actor_id = %s"
    myCursor.execute(query,(actorID,))
    for i in myCursor:
        movies.append(i)
    return movies
#searching by director id
def searchByDirectorID(directorID):
    movies = []
    query = "select movie_name,release_date,url from movie natural join movie_directors where director_id = %s"
    myCursor.execute(query,(directorID,))
    for i in myCursor:
        movies.append(i)
    return movies
#searching by director name
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
#search the password by having email address
def searchPassword(email):
    query = 'select passwords from account where email = %s'
    myCursor.execute(query,(email,))
    for i in myCursor:
        password = i
        return password[0]