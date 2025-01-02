require 'spec_helper'
require_relative '../day-5/day-5-b'

RSpec.describe 'Day5' do
  let(:instructions) do
    <<~INPUT
      47|53
      97|13
      97|61
      97|47
      75|29
      61|13
      75|53
      29|13
      97|29
      53|29
      61|53
      97|53
      61|29
      47|13
      75|47
      97|75
      47|61
      75|61
      47|29
      75|13
      53|13
    INPUT
  end
  let(:page_order) do
    <<~INPUT
75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
    INPUT
  end

  describe '#find_middle' do
    it 'has some behaviour' do
      result = find_middle([1,2,3])
      expect(result).to eq 2
    end
  end

  describe '#main' do
    it 'has some behaviour' do
      result = main(instructions, page_order)
      expect(result).to eq 123
    end
  end

  describe '#re_organize' do
    it 'reorganizes to the page_order' do
      rules = make_rules(instructions)
      reorged = re_organize([75,97,47,61,53],rules)
      expect(reorged).to eq([97,75,47,61,53])
    end
  end

end
