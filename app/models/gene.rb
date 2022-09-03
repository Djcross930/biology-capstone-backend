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

  def amino_acid_sequence
    switch = 0
    sequence = cds_sequence.split("")
    amino_acid_index = 0
    base_pair_index = 0
    protein = []
    while switch == 0
      amino_acids = []
      amino_acids << sequence[amino_acid_index]
      amino_acids << sequence[amino_acid_index + 1]
      amino_acids << sequence[amino_acid_index + 2]
      if  (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "G") 
        protein << "M"
        amino_acid_index += 3
      elsif (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "A")
        protein << "I"
        amino_acid_index += 3
      
      
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "C")
        protein << "F"
        amino_acid_index += 3
      
      
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "G") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "G")
        protein << "L"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "T" && amino_acids[base_pair_index + 2] == "G")
        protein << "V"
        amino_acid_index += 3
    
      
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "G") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "C")
        protein << "S"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "G")
        protein << "P"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "G")
        protein << "T"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "C" && amino_acids[base_pair_index + 2] == "G")
        protein << "A"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "C")
        protein << "Y"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "C")
        protein << "H"
        amino_acid_index += 3
    
      
      elsif (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "G")
        protein << "Q"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "C")
        protein << "N"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "G")
        protein << "K"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "C")
        protein << "D"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "G")
        protein << "E"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "C")
        protein << "C"
        amino_acid_index += 3
    
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "G")
        protein << "W"
        amino_acid_index += 3
    
    
      elsif (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "C" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "G") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "A" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "G") 
        protein << "R"
        amino_acid_index += 3
    
    
    
      elsif (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "T") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "C") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "G" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "G")
        protein << "G"
        amino_acid_index += 3
    
      
      elsif (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "A") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "A" && amino_acids[base_pair_index + 2] == "G") || (amino_acids[base_pair_index] == "T" && amino_acids[base_pair_index + 1] == "G" && amino_acids[base_pair_index + 2] == "A")
        protein << "-"
        switch = 1
      end
    end
    return protein
  end




end
