@hash = {
  "2" => "abc",
  "3" => "def",
  "4" => "ghi",
  "5" => "jkl",
  "6" => "mno",
  "7" => "pqrs",
  "8" => "tuv",
  "9" => "wxyz",
  "23" => "qcd"
}

@result = []
def dfs(digits, index, tmp)
  if index == digits.length
    @result.push(tmp.clone)
    return
  end

  for i in index...digits.length
    value = @hash[digits[index..i]]
    if !value.nil?
      for j in 0...value.length
        tmp << value[j]
        dfs(digits, i + 1, tmp)
        tmp.pop
      end
    end
  end
end

dfs('234', 0, [])