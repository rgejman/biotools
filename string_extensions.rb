class String
  DNA_COMPLEMENTS_TABLE = {"A" => "T", "C" => "G", "G" => "C", "T" => "A", "a" => "t", "c" => "g", "g" => "c", "t" => "a", "-" => "-", "N" => "N", "n" =>"n", "R" => "R", "r" => "r"}
  RNA_COMPLEMENTS_TABLE = {"A" => "U", "C" => "G", "G" => "C", "U" => "A", "a" => "u", "c" => "g", "g" => "c", "u" => "a", "-" => "-", "N" => "N", "n" =>"n", "R" => "R", "r" => "r"}
  
  def dna_complement
    #MAKE THIS FASTER
    self.split("").collect {|s| DNA_COMPLEMENTS_TABLE[s] }.to_s
  end
  
  def dna_revcom
    self.dna_complement.reverse
  end
  
  def rna_complement
    self.split("").collect {|s| RNA_COMPLEMENTS_TABLE[s] }.to_s
  end
  
  def rna_revcom
    self.rna_complement.reverse
  end
  
end