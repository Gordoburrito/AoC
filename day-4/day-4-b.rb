samp = File.read('day-4-input.txt')

@data = []

# TODO: find the A's and then check the diagonal's

# find X M up and left
# find S bottom right( that's a valid)

# .M.S.
# ..A..
# .M.S

samp.split("\n").each do |x|
  @data << x.split('')
end

def find_xmas(x, y)
  first_cross = [@data[y - 1][x - 1], @data[y + 1][x + 1]]
  second_cross = [@data[y - 1][x + 1], @data[y + 1][x - 1]]

  return 1 if first_cross.sort == %w[M S] && second_cross.sort == %w[M S]

  0
end

total_xmas_count = 0

@data.each_with_index do |row, y|
  next if y.zero? || y == @data.length - 1

  row.each_with_index do |el, x|
    next if x.zero? || x == row.length - 1

    total_xmas_count += find_xmas(x, y) if el == 'A'
  end
end

p "total_xmas_count: #{total_xmas_count}"
