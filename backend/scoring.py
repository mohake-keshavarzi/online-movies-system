import mysql.connector
import datetime
#establishing connection
onlineMoviesDB = mysql.connector.connect(host = 'localhost',username = 'root',password = None,database = 'mySql')
myCursor = onlineMoviesDB.cursor()
#function below is used for giving score to a movie or series
def scoring(username,movieName,score):
    result = None
    query1 = 'select * from account_movie_grade where account_username = %s and movie_name = %s'
    myCursor.execute(query1,(username,movie))
    for i in myCursor:
        result = i
        break
    if result == None:
        query2 = 'insert into account_movie_grade (account_username,movie_name,grade,grade_date) values (%s,%s,%s,%s)'
        myCursor.execute(query2,(username,movieName,score,datetime.date.today()))
    else:
        query2 = 'update account_movie_grade set grade = %s where account_username = %s and movie_name = %s'
        myCursor.execute(query2,(score,))
    onlineMoviesDB.commit()