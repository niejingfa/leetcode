arr = [1, -4, 2, -1, 2, 6, 1, 4]
def test(arr)
  len = arr.length
  max = arr[0]
  for i in (1...len)
    if arr[i] + arr[i - 1] > arr[i]
      arr[i] = arr[i] + arr[i - 1]
    end

    if arr[i] > max
      max = arr[i]
    end
  end
  return max
end