package main
import "os"

var user = os.Getenv("PROJECT_USER")

func init_env() {
	if user == "" {
		panic("no value for $PROJECT_USER")
	}
}

func main() {
	init_env()
}
