samp = File.read('day-1-input-copy.txt')
pp samp
left = []
right = []

#stick em in 2 arrays and sort them and add em up 
samp.split("\n").compact.each do |x|
  a,b = x.split("   ")
  left << a.to_i
  right << b.to_i
end

total = 0

left.each do |x|
  total += x * right.count(x)
end

p total
