package main
import "fmt"
import "os"
import "io"

func CopyFile(dstName, srcName string) (written int64, err error) {
	src, err := os.Open(srcName)
	if err != nil {
		return
	}
	defer src.Close()

	dst, err := os.Open(dstName)
	if err != nil {
		return
	}
	defer dst.Close()

	return io.Copy(dst, src)
}

func main() {
	CopyFile("not_exit_1", "not_exist_2")
	for i:= 0; i < 5; i++ {
		defer fmt.Printf("%d ", i)
	}
}
