# frozen_string_literal: true

def sort_staffs(staffs)
  positions = { 'tonggiamdoc' => 0, 'giamdoc' => 1, 'truongphong' => 2, 'nhanvienvp' => 3, 'nhanviensale' => 4 }
  staffs.sort_by do |staff|
    max_priority = staff[:positions].min_by { |pos| positions[pos] }
    staff[:positions].sort_by! { |position| positions[position] }
    [positions[max_priority], staff[:id]]
  end
end
