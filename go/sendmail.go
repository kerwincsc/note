package main

import(
"net/smtp"
"fmt"
"strings"
)

/*
** user: example@example.com login smtp sever user
** passwd: xxxxxx login smtp server password
** host: stmp.example.com:port smtp.163.com:25
** to: example@example.com;example1@163.com;example2@sina.cn;...
** subject:The subject of mail
** body: The content of mail
** mailtype: mail type html or text
 */

func SendMail(user, password, host, to, subject, body, mailtype string) error{
	hp :=strings.Split(host, ":")
	auth := smtp.PlainAuth("", user, password, hp[0])
	var content_type string
	if mailtype == "html" {
		content_type = "Content-Type:text/" + mailtype + "; charset=UTF-8"
	}else{
		content_type = "Content-Type:text/plain" + "; charset=UTF-8"
	}

	msg := []byte("To:" + to + "\r\nFrom: " + user + "<" + user + ">\r\nSubject: " + subject + "\r\n" + content_type + "\r\n\r\n" + body)
	send_to := strings.Split(to, ";")
	err := smtp.SendMail(host, auth, user, send_to, msg)
	return err
}

func main(){
	user := "username@163.com"
	password := "abcdedg"
	host := "smtp.163.com:25"
	to := "username@foxmail.com"

	subject := "Test send email by golang"

	body :=`
	<html>
	<body>
	<h3>
	"Test send email by golang"
	<br />
	"It looks like working well"
	</h3>
	</body>
	</html>
	`

	fmt.Println("send email")
	err := SendMail(user, password, host, to, subject, body, "html")
	if err !=nil {
		fmt.Println("Send mail error!")
		fmt.Println(err)
	}else{
		fmt.Println("Send mail success!")
	}
}
