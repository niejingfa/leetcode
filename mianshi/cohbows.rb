# 规则
#
# 游戏每一局有10轮
# 每一轮有2次抛球机会
# 基本规则：击倒几个球就得几分。例如 3 4, 2 7 -> [7, 9]
# 特殊规则1: 每一轮第二抛击倒所有瓶子，那当前轮所得分为10+下一抛击倒瓶子数
# 例如 3 7, 2 8, 3 5  -> [12, 13, 8]
# 特殊规则2: 每一轮第一抛击倒所有瓶子，那当前轮所得分为10+下两抛击倒瓶子数
# 例如 10, 2 8, 3 5 -> [20, 13, 8]

def total_score(scores)
  # fill out this method
  solution = 0
  arr = scores.split(/\s*/)
  hash = {}
  
  (0...arr.length).to_a.reverse.each do |i|
    if arr[i] == 'X'
      if arr[i + 1] == 'X'
        first = 10
      elsif arr[i + 1] == '/'
        first = 10 - arr[i].to_i
      else
        first = hash[i + 1].to_i
      end
      
      if arr[i + 2] == 'X'
        second = 10
      elsif arr[i + 2] == '/'
        second = 10 - arr[i + 1].to_i
      else
        second = hash[i + 2].to_i
      end
      
      hash[i] = first + second + 10
    elsif arr[i] == '/'
      hash[i] = 10  - arr[i - 1].to_i + hash[i + 1]
    else
      hash[i] = arr[i].to_i
    end
    
    solution += hash[i]
  end
  
  solution
end

# game with no strikes or spares
scores_1 = '23  23  23  23  23  23  23  23  23  23'
  # frames:  5,  5,  5,  5,  5,  5,  5,  5,  5,  5
  # total:   5, 10, 15, 20, 25, 30, 35, 40, 45, 50
solution_1 = 50

# scores game with spares
scores_2 = '2/  32  23  23  23  23  23  23  23  23'
  # frames: 13,  5,  5,  5,  5,  5,  5,  5,  5,  5
  # total:  13, 18, 23, 28, 33, 38, 43, 48, 53, 58
solution_2 = 58

# scores game with strikes
scores_3 =  'X  23  23  23  23  23  23  23  23  23'
  # frames: 15,  5,  5,  5,  5,  5,  5,  5,  5,  5
  # total:  15, 20, 25, 30, 35, 40, 45, 50, 55, 60

solution_3 = 60

# scores game with consecutive strikes
scores_4 =  'X   X   X  23  23  23  23  23  23  23'
  # frames: 30, 22, 15,  5,  5,  5,  5,  5,  5,  5
  # total:  30, 52, 67, 72, 77, 82, 87, 92, 97, 102
solution_4 = 102

# scores game with spare proceeding strike
scores_5 =  'X  2/  23  23  23  23  23  23  23  23'
  # frames: 20, 12,  5,  5,  5,  5,  5,  5,  5,  5
  # total:  20, 32, 37, 42, 47, 52, 57, 62, 67, 72

solution_5 = 72

def run_test(input, expected_result)
  puts "Input:    #{input}"
  puts "Expected: #{expected_result}"
  puts "Got:      #{total_score(input)}"
  puts
end

run_test(scores_1, solution_1)
run_test(scores_2, solution_2)
run_test(scores_3, solution_3)
run_test(scores_4, solution_4)
run_test(scores_5, solution_5)
