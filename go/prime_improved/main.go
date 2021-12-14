// 启动多个 goroutine 计算素数
package main

import (
	"fmt"
)

func initNumber(intChan chan int) {
	for i := 1; i < 80000; i++ {
		intChan <- i
	}

	close(intChan)
}

func calPrime(intChan chan int, primeChan chan int, boolChan chan bool) {

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

	boolChan <- true
}

func main() {

	intChan := make(chan int, 1000)
	primeChan := make(chan int, 20000)
	boolChan := make(chan bool, 4)
	go initNumber(intChan)

	for i := 0; i < 4; i ++ {
		go calPrime(intChan, primeChan, boolChan)
	}


	go func() {
		for i := 0; i < 4; i ++ {
			<-boolChan
		}
	
		close(primeChan)
	}()

	for i := range primeChan {
		fmt.Println(i)
	}
}