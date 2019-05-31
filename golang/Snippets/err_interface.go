package main
import "fmt"
import "errors"

type myError struct {
	arg int
	errMsg string
}

func (e *myError) Error() string {
	return fmt.Sprintf("%d - %s", e.arg, e.errMsg)
}

func error_test(arg int) (int, error) {
	if arg < 0 {
		return -1, errors.New("Bad Arguments - negtive!")
	} else if arg > 256 {
		return -1, &myError{arg, "Bad Arguments - too large!"}
	}
	return arg * arg, nil
}

func main() {
	for _, i := range []int{-1, 4, 1000} {
		if r, e := error_test(i); e != nil {
			fmt.Println("failed:", e)
		} else {
			fmt.Println("success:", r)
		}
	}
}
