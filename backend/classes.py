#defining some sql tables as classes
class Account():
    def __init__(self,username,password,email,joinedDate,memberShip,memberShipTime):
        self.username = username
        self.password = password
        self.email = email
        self.joinedDate = joinedDate
        self.memberShip = memberShip
        self.memberShipTime = memberShipTime
class Artist():
    def __init__(self,personalID,firsName,lastName,birthDate,age):
        self.personalID = personalID
        self.firsName = firsName
        self.lastName = lastName
        self.birthDate = birthDate
        self.age = age
    def __str__(self):
        return str(self.personalID)+' '+self.firsName+' '+self.lastName+' '+str(self.birthDate)+' '+str(self.age)
class Actor(Artist):
    def __init__(self, personalID, firsName, lastName, birthDate, age):
        super().__init__(personalID, firsName, lastName, birthDate, age)
class Director(Artist):
    def __init__(self, personalID, firsName, lastName, birthDate, age):
        super().__init__(personalID, firsName, lastName, birthDate, age)
class Movie():
    def __init__(self,movieName,releaseDate,url):
        self.movieName = movieName
        self.releaseDate = releaseDate
        self.url = url

