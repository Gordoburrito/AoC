samp = File.read('day-1-b-input.txt')
pp samp
left = []
right = []

#stick em in 2 arrays and sort them and add em up 
samp.split("\n").compact.each do |x|
  a,b = x.split("   ")
  left << a.to_i
  right << b.to_i
end

p left.sort
p right.sort


puts ("left")
left_sorted = left.sort
puts ("right")
right_sorted = right.sort

total = 0

pp left_sorted
pp right_sorted

left_sorted.each_with_index do |x, i|
  total += (x - right_sorted[i]).abs
end

p total
