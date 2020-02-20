package main

import "fmt"
import "os"

func main() {
	args := os.Args
	fmt.Println(args)
	fmt.Println(args[1:])
}
