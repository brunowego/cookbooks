package main
import "fmt"

func main() {
	channel := make(chan string, 2)

	go func() {
		channel <- "Hello"
		channel <- "World"
	}()

	msg1 := <-channel
	msg2 := <-channel
	fmt.Println(msg1, msg2)
}
