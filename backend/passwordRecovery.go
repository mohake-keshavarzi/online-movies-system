package main
//necessary libraries
import(
	"fmt"
	"math/rand"
	"net/smtp"
)
//function below is for making a new random password with length of 10
func passwordGenerator() string{
	randomPassword := ""
	characters := "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()"
	charactersLength := len(characters)
	for i := 0;i < 10;i++ {
		randomIndex := rand.Intn(charactersLength)
		randomCharacter := characters[randomIndex:randomIndex+1]
		randomPassword += randomCharacter
	}
	return randomPassword
}
//function below sends recovery email to target main Address
func sendEmail(targetEmail string){
	//sender email properties
	from := "mmdspam79@gmail.com"
	emailPassword := "fshvlvsknwthnxrf"
	randomPassword := passwordGenerator()
	randomPasswordBytes := []byte(randomPassword)
	//host and port
	host := "smtp.gmail.com"
	port := "587"
	//sending email to targets
	toSendList := []string{targetEmail}
	authentication := smtp.PlainAuth("",from,emailPassword,host)
	error := smtp.SendMail(host+":"+port,authentication,from,toSendList,randomPasswordBytes)
	fmt.Println(error)
}
//main function
func main(){
	//TODO
}