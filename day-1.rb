samp = File.read('day-1-input.txt')
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

# puts "split_samp"
# p split_samp



# split = split_samp.map do |x|
#   if x == " " || x == "\n"
#     next
#   else
#     x.to_i
#   end
# end.compact

# puts "split"
# p split

split.each_with_index do |x, i|
  if i % 2 == 0
    right.append(x)
  else
    left.append(x)
  end
end

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
