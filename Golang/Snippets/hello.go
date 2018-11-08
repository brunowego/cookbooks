/*
 * go run hello.go
 * or go build hello.go; ./hello
 */
package main

import "fmt"
import "math"

func main() {
	fmt.Println("Hello world")

	fmt.Printf("%t\n", 1==2)
	fmt.Printf("Bin:%b\n", 255)
	fmt.Printf("Oct:%o\n", 255)
	fmt.Printf("Hex:%X\n", 255)
	fmt.Printf("Dec:%d\n", 255)
	fmt.Printf("Float:%f\n", math.Pi)
	fmt.Printf("String:%s\n", "hello world")
}
