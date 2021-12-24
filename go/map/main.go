package main

import (
	"fmt"
)

func main() {
	var mp = make(map[int]int, 1000)

	for k, v := range mp {
		fmt.Printf("k: %d, v: %d\n", k, v)
	}
}