import mysql.connector
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#search by different movie attributes
#searching by name of the movie
def searchByMovieName(movieName):
    query = 'select * from movie where movie_name = %s'
    myCursor.execute(query,(movieName,))
    for i in myCursor:
        print(i)
#searching by year of the movie
def searchByMovieYear(publishedYear):
    query = 'select * from movie where year(release_date) = %s'
    myCursor.execute(query,(publishedYear,))
    for i in myCursor:
        print(i)
#searching by generes
def searchByMovieGenre(genre):
    query = 'select * from movie_genres natural join movie where genre = %s'
    myCursor.execute(query,(genre,))
    for i in myCursor:
        print(i)
#test
print('movie name')
searchByMovieName('lost in the wood')
print('movie year')
searchByMovieYear('2016')
print('movie genre')
searchByMovieGenre('Action')