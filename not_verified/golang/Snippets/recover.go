package main
import "fmt"

func g(i int) {
	if i>1 {
		fmt.Println("Panic!")
		panic(fmt.Sprintf("%v", i))
	}

}

func f() {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("Recovered in f", r)
		}
	}()

	for i := 0; i < 4; i++ {
		fmt.Println("Calling g with ", i)
		g(i)
		fmt.Println("Returned normally from g.")
	 }
}

func main() {
	f()
	fmt.Println("Returned normally from f.")
}
