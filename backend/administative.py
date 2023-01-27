import mysql.connector
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#function below is for adding a movie or series
def addMovie(movieName,releaseDate,url):
    query = 'insert into movie (movie_name,release_date,url) value (%s,%s,%s)'
    myCursor.execute(query,(movieName,releaseDate,url))
    onlineMoviesDB.commit()
#function below is for adding more information to movies
def addMovieInformation(movieName,actorsID,directorsID,genres):
    query1 = 'insert into movie_actors (movie_name,actor_id) values (%s,%s)'
    query2 = 'insert into movie_directors (movie_name,director_id) values (%s,%s)'
    query3 = 'insert into movie_genres (movie_name,genre) values (%s,%s)'
    for i in actorsID:
        myCursor.execute(query1,(movieName,i))
    for i in directorsID:
        myCursor.execute(query2,(movieName,i))
    for i in genres:
        myCursor.execute(query3,(movieName,i))
    onlineMoviesDB.commit()
    
