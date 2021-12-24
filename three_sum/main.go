package main

import (
	"fmt"
	"sort"
)

func threeSum(nums []int) [][]int {
  sort.Ints(nums)
	fmt.Println(nums)
	for index, item := range nums {
		fmt.Println(index, item)
	}
	return nil
}

func main() {
	threeSum([]int{-1, 0, 1, 2, -1, -4})
}