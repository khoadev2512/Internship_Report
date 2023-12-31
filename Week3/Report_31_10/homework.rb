# frozen_string_literal: true

def convert_dna(dna)
  arr = { 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C' }
  dna = dna.split('')
  return 'Wrong DNA' if dna == [] || dna.any? { |i| !arr.keys.include?(i) }

  dna.map { |i| arr[i] }.join
end
