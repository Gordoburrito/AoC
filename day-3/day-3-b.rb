samp = File.read('day-3-b.txt')

# p samp

# "mul("...")", "do()", "don't()"
gen_pattern = /mul\([^()]*\)|do\(\)|don't\(\)/

matches = samp.scan(gen_pattern)

clean_matches = []
enabled = true
matches.each do |match|
  if match == 'do()'
    enabled = true
    next
  end
  if match == "don't()"
    enabled = false
    next
  end
  clean_matches << match if enabled
end

# p clean_matches

# between the parens is "num,num" between 1 and 3 digits
def good_mul?(mul)
  mul.match(/mul\(\d{1,3},\d{1,3}\)/) ? true : false
end

good_muls = []

clean_matches.each do |mul|
  good_muls << mul if good_mul?(mul)
end

# p good_muls

mul_params = []

good_muls.each do |mul|
  mul_params << mul.scan(/\d+/).map(&:to_i)
end

# p mul_params

def mul(first, second)
  first * second
end

tot = 0
mul_params.each do |param_pair|
  first, second = param_pair
  tot += mul(first, second)
end

p tot
