arr = [2,3,5,6,8]
target = 8

@result = []
@tmp = []

def dfs(arr, target)
  if target == 0
    @result << @tmp
    @tmp = []
    return
  end

  if target < 0
    @tmp = []
    return
  end

  for i in (0..arr.length - 1)
    tmp = @tmp.clone
    @tmp << arr[i]
    dfs(arr[i..-1], target - arr[i])
    @tmp = tmp
  end
end

dfs(arr, target)