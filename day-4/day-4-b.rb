samp = File.read('day-4-input.txt')

@data = []


# TODO: find the A's and then check the diagonal's 

find X M up and left
find S bottom right( that's a valid)

.M.S.
..A..
.M.S


samp.split("\n").each do |x|
  @data << x.split('')
end

def find_xmas(x, y, x_max, y_max)
  # 4,0
  directions = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
  comp_directions = [[1, 1] [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
  xmas_arr = %w[M A S]
  distance = xmas_arr.length
  
  xmas_count = 0

  puts ("NEW X AND Y AT THE X")
  puts "#{x}, #{y}"
  directions.each_with_index do |dir, dir_i|
    dx, dy = dir
    # 0, 1
    # distance.times do |3|

    # can't go the distance
    if edge_case(x, y, dx * (distance - 1), dy * (distance - 1), x_max, y_max)
      puts "edge_case_found #{dir}, #{dir_i}"
      next
    end


    if dir_find_xmas(x, y, dx, dy)
      xmas_count += 1
      puts "found! #{dir}, #{dir_i}"
    end
  end
  p ("xmas_count: #{xmas_count}")
  return xmas_count
end

def dir_find_xmas(x, y, dx, dy)
  xmas_arr = %w[X M A S]
  distance = xmas_arr.length

  distance.times do |i|
    # x,y (4,0)
    # dx,dy (0,1)
    return false if xmas_arr[i] != get_letter(x, y, dx * i, dy * i)
  end
  true
end

def edge_case(x, y, dx, dy, x_max, y_max)
  new_y = y - dy
  new_x = x + dx
  return true if new_y.negative? || new_y > y_max
  return true if new_x.negative? || new_x > x_max
end

def get_letter(x, y, dx, dy)
  @data[y - dy][x + dx] if y - dy
end

total_xmas_count = 0
@data.each_with_index do |row, y|
  row.each_with_index do |col, x|
    total_xmas_count += find_xmas(x, y, row.length - 1, @data.length - 1) if col == 'X'
  end
end

p "total_xmas_count"
p total_xmas_count
