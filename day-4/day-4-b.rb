samp = File.read('day-4-input.txt')

@data = []

def find_the_A do
  @data.
end

# TODO: find the A's and then check the diagonal's

# find X M up and left
# find S bottom right( that's a valid)

# .M.S.
# ..A..
# .M.S


samp.split("\n").each do |x|
  @data << x.split('')
end

def find_xmas(x,y) do

  # next if  x-1 && y+1 != M || S
  return xmas_count
end


def edge_case(x, y, dx, dy, x_max, y_max)
  new_y = y - dy
  new_x = x + dx
  return true if new_y.negative? || new_y > y_max
  return true if new_x.negative? || new_x > x_max
end

def get_letter()

end

total_xmas_count = 0
@data.each_with_index do |row, y|
  row.each_with_index do |el, x|
    total_xmas_count += find_xmas(x,y) if el == 'A'
  end
end

p "total_xmas_count"
p total_xmas_count
