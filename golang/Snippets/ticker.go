package main

import "time"
import "fmt"

func main() {
	ticker := time.NewTicker(time.Second)

	for t := range ticker.C {
		fmt.Println("ticker at", t)
	}
}
