package main

import "time"
import "fmt"

func main() {
	ticker := time.NewTicker(time.Second)

	go func() {
		for t := range ticker.C {
			fmt.Println(t)
		}
	}()

	timer := time.NewTimer(10*time.Second)
	<- timer.C

	ticker.Stop()
	fmt.Println("timer expired!")
}
