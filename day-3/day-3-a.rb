samp = File.read('day-3-a.txt')

p samp

# "mul("...")"
gen_pattern = /mul\([^()]*\)/

gen_mul_matches = samp.scan(gen_pattern)

p gen_mul_matches

# between the parens is "num,num" between 1 and 3 digits
def good_mul?(mul)
  mul.match(/mul\(\d{1,3},\d{1,3}\)/) ? true : false
end

good_muls = []

gen_mul_matches.each do |mul|
  good_muls << mul if good_mul?(mul)
end

p good_muls

mul_params = []

good_muls.each do |mul|
  mul_params << mul.scan(/\d+/).map(&:to_i)
end

p mul_params

def mul(first, second)
  first * second
end

tot = 0
mul_params.each do |param_pair|
  first, second = param_pair
  tot += mul(first, second)
end

p tot
