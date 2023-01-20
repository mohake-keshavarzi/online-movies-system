import mysql.connector
from datetime import datetime
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#function below is for liking or unliking the movie
def likeDislike(username,movieName,likes,likesDate):
    result = b'0'
    query1 = 'select likes from account_movie_like where account_username = %s and movie_name = %s'
    myCursor.execute(query1,(username,movieName))
    for i in myCursor:
        result = i
        break
    if result == b'0':
        query2 = 'update account_movie_like set likes = %s and likes_date = %s where account_username = %s and moviename = %s'
        myCursor.execute(query1,(b'1',datetime.date.today(),username,movieName))
    else:
        query2 = 'update account_movie_like set likes = %s and likes_date = %s where account_username = %s and moviename = %s'
        myCursor.execute(query1,(b'0',datetime.date.today(),username,movieName))