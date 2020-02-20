package main
import "os/exec"
import "fmt"

func main() {
	cmd := exec.Command("ping", "127.0.0.1", "-c 10")
	out, err := cmd.Output()
	if err != nil {
		println("Command Error", err.Error())
		return
	}
	fmt.Println(string(out))
}

