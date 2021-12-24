require 'set'
str = "this is a sentence it is not a good one and it is also bad"

def build_struct(str)
  hash = {}
  arr = str.split(/\s+/)
  for i in 0...(arr.length - 1)
    hash[arr[i]] ||= []
    set = Set.new(hash[arr[i]])
    set.add(arr[i + 1])
    hash[arr[i]] = set.to_a
  end
  hash
end

hash = build_struct(str)

@result = []
@word = 'cat'
@tmp = [@word]
target = 2
def dfs(hash, word, target)
  if target == 0
    @result << @tmp.clone
    return
  end

  if hash[word].nil? || word.nil?
    return
  end

  (hash[word] || []).each do |item|
    next if item == @word
    @tmp << item
    dfs(hash, item, target - 1)
    @tmp.pop  
  end
end

dfs(hash, @word, target)