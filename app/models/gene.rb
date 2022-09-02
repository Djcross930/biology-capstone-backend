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

  def mrna_sequence
    sequence = cds_sequence.split("")
    rna_sequence = []
    sequence.each do |base|
      if base == "T"
        rna_sequence << "U"
      else
        rna_sequence << base
      end
    end
    return rna_sequence
  end

  def c_content
    sequence = cds_sequence.split("")
    c = sequence.count("C")
    c = c.to_f
    total = sequence.length.to_f
    c_ratio = (c / total)
    return c_ratio.to_f 
  end

  def g_content
    return c_content()
  end
  def a_content
    total = (1 - (c_content() * 2))
    g = (total / 2)
    return g
  end

  def t_content
    return a_content()
  end

  def g_c_content
    return (c_content() * 2)
  end
end
