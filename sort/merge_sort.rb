## 归并排序

def merge_sort(arr, left, right)
  return if left >= right
  middle = (right - left) / 2 + left
  merge_sort(arr, left, middle)
  merge_sort(arr, middle + 1, right)
  merge(arr, left, middle + 1, right)
end

def merge(arr, left, middle, right)
  left_arr, right_arr = arr[left...middle], arr[middle..right]

  i, j, k = 0, 0, left
  while i < left_arr.length && j < right_arr.length
    if left_arr[i] < right_arr[j]
      arr[k] = left_arr[i]
      i += 1
    else
      arr[k] = right_arr[j]
      j += 1
    end

    k += 1
  end

  (i...left_arr.length).each do |l|
    arr[k] = left_arr[l]
    k += 1
  end
  (j...right_arr.length).each do |r|
    arr[k] = right_arr[r]
    k += 1
  end
end


arr = [2,5,8,10,3,6,8,9]

p "排序前: #{ arr }"
merge_sort(arr, 0, 7)
p "排序后: #{ arr }"


arr = [6,9,8,2,3,10,8,5]

p "排序前: #{ arr }"
merge_sort(arr, 0, 7)
p "排序后: #{ arr }"