require 'spec_helper'
require_relative '../day-6/day-6'

RSpec.describe 'Day6' do
  let(:start) do
    <<~INPUT
      ....#.....
      .........#
      ..........
      ..#.......
      .......#..
      ..........
      .#..^.....
      ........#.
      #.........
      ......#...
    INPUT
  end

  describe '#main' do
    it 'returns distinct positions' do
      result = main(start)
      expect(result).to eq 42
    end
  end
end
