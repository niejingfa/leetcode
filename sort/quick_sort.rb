## 快速排序

def quick_sort(arr, left, right)
  return if left >= right
  i, j = left, right
  pivot = arr[i]

  while i < j
    while i < j && arr[j] >= pivot
      j -= 1
    end
    arr[i] = arr[j] if i < j

    while i < j && arr[i] <= pivot
       i += 1
    end
    arr[j] = arr[i] if i < j
  end

  arr[i] = pivot

  quick_sort(arr, left, i)
  quick_sort(arr, i + 1, right)
end

arr = [5,1,3,4,7,8,2]
p arr
quick_sort(arr, 0, arr.length - 1)
p arr
p "========"
arr = [2,2,2,3,6,4]
p arr
quick_sort(arr, 0, arr.length - 1)
p arr