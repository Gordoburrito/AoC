samp = File.read('day-2-input.txt')
pp samp


arr = []
samp.split("\n").compact.each do |x|
  arr << x.split(" ").map {|a| a.to_i}
end

def ascending?(sub_arr)
  sub_arr.sort == sub_arr
end

def descending?(sub_arr)
  sub_arr.sort.reverse == sub_arr
end

def good_gap?(a,b)
  diff = (a-b).abs
  return diff > 0 && diff <= 3
end

def good_gaps?(sub_arr)
  sub_arr.each_with_index do |x, i|
    unless i == sub_arr.length - 1
      return false unless good_gap?(x, sub_arr[i + 1])
    end
  end
  return true
end

count = 0

arr.each do |sub_arr|
  next unless descending?(sub_arr) || ascending?(sub_arr)
  next unless good_gaps?(sub_arr)
  count += 1
end
p count