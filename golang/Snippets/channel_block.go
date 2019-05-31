package main
import "fmt"
import "time"

func main() {
	channel := make(chan string) // buffer is 1

	go func() {
		channel <- "Hello"
		fmt.Println("write \"Hello\" done!")

		channel <- "World" // Reader is sleep, block here
		fmt.Println("write \"World\" done!")

		fmt.Println("Write go sleep ...")
		time.Sleep(3*time.Second)
		channel <- "channel"
		fmt.Println("write \"channel\" done!")
	}()

	time.Sleep(2*time.Second)
	fmt.Println("Reader wake up...")

	msg := <-channel
	fmt.Println("Reader: ", msg)

	msg = <-channel
	fmt.Println("Reader: ", msg)

	msg = <-channel // writer is sleep, we block here
	fmt.Println("Reader: ", msg)
}
