package main

import "fmt"
import "time"

func main() {
	timer := time.NewTimer(2*time.Second)

	<- timer.C
	fmt.Println("timer expired!")
}
