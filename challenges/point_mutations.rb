class DNA
  attr_reader :dna

  def initialize(dna_strand)
    @dna = dna_strand
  end

  def hamming_distance(other_dna)
    # max_idx = dna.size < other_dna.size ? dna.size : other_dna.size
    # hamming = 0
    # (0...max_idx).each do |idx|
    #   hamming += 1 unless dna[idx] == other_dna[idx]
    # end
    # hamming

    short, long = [dna, other_dna].sort_by(&:size)
    (0...short.size).count { |idx| short[idx] != long[idx] }
  end
end

# p DNA.new('GGACTGA').hamming_distance('GGACTGA')
# p DNA.new('GGATCGA').hamming_distance('GGACTGA')