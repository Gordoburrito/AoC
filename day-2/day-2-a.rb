samp = File.read('day-2-input.txt')
pp samp

data = []
samp.split("\n").compact.each do |x|
  data << x.split(' ').map(&:to_i)
end

def ascending?(arr)
  arr.sort == arr
end

def descending?(arr)
  arr.sort.reverse == arr
end

def good_gap?(a, b)
  diff = (a - b).abs
  diff.positive? && diff <= 3
end

def good_gaps?(arr)
  arr.each_with_index do |x, i|
    return false if i != arr.length - 1 && !good_gap?(x, arr[i + 1])
  end
  true
end

def good_arr?(arr)
  (descending?(arr) || ascending?(arr)) && good_gaps?(arr)
end

def problem_dampener(row)
  return true if good_arr?(row)

  row.length.times do |i|
    dup = row.dup
    dup.delete_at(i)
    return true if good_arr?(dup)
  end
  false
end

def amount_of_good_reports(data)
  count = 0
  data.each do |row|
    count += 1 if problem_dampener(row)
  end
  count
end

p amount_of_good_reports(data)
