class String
  DNA_COMPLEMENTS_TABLE = {"A" => "T", "C" => "G", "G" => "C", "T" => "A"}
  RNA_COMPLEMENTS_TABLE = {"A" => "U", "C" => "G", "G" => "C", "U" => "A"}
  
  def dna_complement
    self.split("").collect {|s| DNA_COMPLEMENTS_TABLE[s] }.join
  end
  
  def dna_revcom
    self.dna_complement.reverse
  end
  
  def rna_complement
    self.split("").collect {|s| RNA_COMPLEMENTS_TABLE[s] }.join
  end
  
  def rna_revcom
    self.rna_complement.reverse
  end
end