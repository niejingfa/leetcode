def can_reach_end(nums)
  len = nums.length

  queue = [0]

  while queue.length > 0
    new_queue = []
    queue.each do |index|
      return true if nums[index] >= len - index - 1
      nums[index].times do |i|
        new_queue << index + i + 1
      end
    end
    queue = new_queue
  end

  return false
end
nums = [5,0,0,0,1,1,0]
can_reach_end(nums)