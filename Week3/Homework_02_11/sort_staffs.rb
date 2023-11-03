# frozen_string_literal: true

require 'test/unit/assertions'
include Test::Unit::Assertions

def sort_staffs(staffs)
  positions = { 'tonggiamdoc' => 0, 'giamdoc' => 1, 'truongphong' => 2, 'nhanvienvp' => 3, 'nhanviensale' => 4 }
  staffs.sort_by do |staff|
    max_priority = staff[:positions].min_by { |position| positions[position] }
    [positions[max_priority], staff[:id]]
  end
end

staffs1 = [
  { id: 1, positions: %w[nhanviensale truongphong] },
  { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }
]
expected_result1 = [
  { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] },
  { id: 1, positions: %w[truongphong nhanviensale] }
]
Test.assert_equal(sort_staffs(staffs1), expected_result1)

staffs2 = []
expected_result2 = []
Test.assert_equal(sort_staffs(staffs2), expected_result2)

staffs3 = [
  { id: 1, positions: ['nhanvienvp'] },
  { id: 2, positions: ['nhanvienvp'] },
  { id: 3, positions: ['nhanvienvp'] }
]
expected_result3 = [
  { id: 1, positions: ['nhanvienvp'] },
  { id: 2, positions: ['nhanvienvp'] },
  { id: 3, positions: ['nhanvienvp'] }
]
Test.assert_equal(sort_staffs(staffs3), expected_result3)

staffs4 = [
  { id: 1, positions: ['nhanviensale'] },
  { id: 2, positions: ['truongphong'] },
  { id: 3, positions: ['tonggiamdoc'] }
]
expected_result4 = [
  { id: 3, positions: ['tonggiamdoc'] },
  { id: 2, positions: ['truongphong'] },
  { id: 1, positions: ['nhanviensale'] }
]
Test.assert_equal(sort_staffs(staffs4), expected_result4)

staffs5 = [
  { id: 1, positions: %w[nhanviensale tonggiamdoc] },
  { id: 2, positions: %w[truongphong tonggiamdoc] },
  { id: 3, positions: %w[tonggiamdoc giamdoc] }
]
expected_result4 = staffs5
Test.assert_equal(sort_staffs(staffs4), expected_result4)
