package main
import "os"
import "strings"

func main() {
	os.Setenv("WEB", "https://google.com")
	println(os.Getenv("WEB"))

	for _, env := range os.Environ() {
		e := strings.Split(env, "=")
		println(e[0], "=", e[1])
	}
}
