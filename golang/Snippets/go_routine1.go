package main
import "fmt"

func f(msg string) {
	fmt.Println(msg)
}

func main() {
	go f("goroutine")

	go func(msg string) {
		fmt.Println(msg)
	}("going")

	var input string
	fmt.Scanln(&input)
}
