// 快速排序
package main

import (
	"fmt"
)

func quickSort(arr *[]int, left int, right int) {
	if left >= right {
		return
	}
	i, j := left, right
	pivot := (*arr)[i]
	for i < j {
		for i < j && pivot <= (*arr)[j] {
			j --
		}
		if i < j {
			(*arr)[i] = (*arr)[j]
		}

		for i < j && pivot >= (*arr)[i] {
			i ++
		}
		if i < j {
			(*arr)[j] = (*arr)[i]
		}
	}
	(*arr)[i] = pivot
	quickSort(arr, left, i)
	quickSort(arr, i + 1, right)
}

func main() {
	arr := []int{5, 4, 2, 4, 7, 3, 8, 9}
	fmt.Printf("排序前：arr=%v\n", arr)
	quickSort(&arr, 0, len(arr) - 1)
	fmt.Printf("排序后：arr=%v\n", arr)
	fmt.Println("=======")

	arr2 := []int{4, 4, 2, 4, 7, 3, 8, 9}
	fmt.Printf("排序前：arr=%v\n", arr2)
	quickSort(&arr2, 0, len(arr2) - 1)
	fmt.Printf("排序后：arr=%v\n", arr2)
}