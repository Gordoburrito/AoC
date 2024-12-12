samp = File.read('day-3-a-samp.txt')

p samp

pattern = /mul\([^()]*\)/

mul_matches = samp.scan(pattern)

p mul_matches

def good_mul?(mul)
  mul.match(/mul\(\d+,\d+\)/)
end


mul_matches.each do |match|
  p good_mul?(match)
end
