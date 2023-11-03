# frozen_string_literal: true

require 'test/unit'
require_relative 'sort_staffs'

# This class use to test funciton sort_staffs
class TestMethod < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_length_array
    staffs1 = [
      { id: 1, positions: %w[nhanviensale truongphong] },
      { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }
    ]
    expected_result1 = [
      { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] },
      { id: 1, positions: %w[truongphong nhanviensale] }
    ]
    staffs2 = []
    expected_result2 = []
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
    staffs5 = [
      { id: 1, positions: %w[nhanviensale tonggiamdoc] },
      { id: 2, positions: %w[truongphong tonggiamdoc] },
      { id: 3, positions: %w[tonggiamdoc giamdoc] }
    ]
    expected_result5 = [
      { id: 1, positions: %w[tonggiamdoc nhanviensale] },
      { id: 2, positions: %w[tonggiamdoc truongphong] },
      { id: 3, positions: %w[tonggiamdoc giamdoc] }
    ]

    assert_equal(sort_staffs(staffs1), expected_result1)
    assert_equal(sort_staffs(staffs2), expected_result2)
    assert_equal(sort_staffs(staffs3), expected_result3)
    assert_equal(sort_staffs(staffs4), expected_result4)
    assert_equal(sort_staffs(staffs5), expected_result5)
  end
end
