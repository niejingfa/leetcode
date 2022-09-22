arr = [2,3,5,6,8]
target = 8

def dfs(arr, target, result, tmp)
  if target == 0
    result << tmp
    tmp = []
    return
  end

  if target < 0
    tmp = []
    return
  end

  for i in (0..arr.length - 1)
    _tmp = tmp.clone
    tmp << arr[i]
    dfs(arr[i..-1], target - arr[i], result, tmp)
    tmp = _tmp
  end
end

result = []
tmp = []
dfs(arr, target, result, tmp)
p result