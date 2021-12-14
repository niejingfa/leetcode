// 计算 1-8000 有多少素数
package main

import (
	"fmt"
)

func initNumber(intChan chan int) {
	for i := 1; i <= 8000; i++ {
		intChan <- i
	}

	close(intChan)
}

func calPrime(intChan chan int, primeChan chan int) {
	var flag bool
	for i := range intChan {
		flag = false
		for j := 2; j < i; j++ {
			if i % j == 0 {
				flag = true
				break
			}
		}
		if !flag {
			primeChan <- i
		}
	}

	close(primeChan)
}

func main() {
	// 放数的channel
	intChan := make(chan int, 1000)
	go initNumber(intChan)
	// 放素数的channel
	primeChan := make(chan int, 2000)
	go calPrime(intChan, primeChan)

	for i := range primeChan {
		fmt.Println(i)
	}
}