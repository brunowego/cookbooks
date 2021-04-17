package main
import "fmt"

type rect struct {
	width, height int
}

func (r *rect) area() int {
	return r.width * r.height
}

func (r *rect) perimeter() int {
	return 2*(r.width * r.height)
}

func main() {
	r := rect{width:10, height:15}

	fmt.Println("Area: ", r.area())
	fmt.Println("Perimeter: ", r.perimeter())

	rp := &r
	fmt.Println("Area: ", rp.area())
	fmt.Println("Perimeter: ", rp.perimeter())
}
