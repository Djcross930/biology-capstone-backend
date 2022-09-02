class Gene < ApplicationRecord
  belongs_to :user, optional: true
  def start_codon
    sequence = cds_sequence.split("")
    start_codon = []
    start_codon << sequence[0]
    start_codon << sequence[1]
    start_codon << sequence[2]
    return start_codon
  end

  def stop_codon
    sequence = cds_sequence.split("")
    stop_codon = []
    stop_codon.unshift(sequence[-1])
    stop_codon.unshift(sequence[-2])
    stop_codon.unshift(sequence[-3])
    return stop_codon
  end
end
