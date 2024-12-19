instructions = File.read('day-5-inst.txt')
page_order = File.read('day-5-order.txt')

rules_arr = instructions.split("\n")
@rules = rules_arr.map do |rule|
  rule.split('|').map(&:to_i)
end

rows = page_order.split("\n").map do |row|
  row.split(',').map(&:to_i)
end

def row_is_good?(row)
  return false if row.length.even?

  @rules.each do |rule|
    lead = rule.first
    follow = rule.last
    lead_index = row.find_index(lead)
    follow_index = row.find_index(follow)
    return false if !lead_index.nil? && !follow_index.nil? && lead_index > follow_index
  end
  true
end

def find_middle(row)
  row[row.length / 2]
end

total = 0
rows.each do |row|
  total += find_middle(row) if row_is_good?(row)
end

pp total
