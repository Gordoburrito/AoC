def find_middle(row)
  row[row.length / 2]
end

def row_is_good?(row, rules)
  return false if row.length.even?

  rules.each do |rule|
    lead = rule.first
    follow = rule.last
    lead_index = row.find_index(lead)
    follow_index = row.find_index(follow)
    return false if !lead_index.nil? && !follow_index.nil? && lead_index > follow_index
  end
  true
end

def re_organize(row, rules)
  rules.each do |rule|
    lead = rule.first
    follow = rule.last
    lead_index = row.find_index(lead)
    follow_index = row.find_index(follow)
    if !lead_index.nil? && !follow_index.nil? && lead_index > follow_index
      row[lead_index], row[follow_index] = row[follow_index], row[lead_index]
    end
  end
  return row if row_is_good?(row, rules)
  re_organize(row, rules)
end

def make_rules(instructions)
  rules_arr = instructions.split("\n")
  rules = rules_arr.map do |rule|
    rule.split('|').map(&:to_i)
  end
  rules
end

def main(instructions, page_order)
  rules = make_rules(instructions)

  rows = page_order.split("\n").map do |row|
    row.split(',').map(&:to_i)
  end

  total = 0
  rows.each do |row|
    if row_is_good?(row, rules)
      next
    else
      total += find_middle(re_organize(row, rules))
    end
  end
  total
end
