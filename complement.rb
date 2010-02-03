#!/usr/bin/env ruby -KU

#Complement a sequence
require 'string_extensions.rb'

if ARGV.length != 1
  puts "Return the complement of an input sequence. DNA is assumed unless a 'U' is present."
  puts "e.g. complement.rb ACGGGGAAT => TGCCCCTT"
  exit 0
end

NUCLEIC_BASES = ["A","C","G","T","U"]
dna = false
rna = false

sequence = ARGV[0].strip
sequence_arr = ARGV[0].split("")

unless sequence_arr.all? {|s| NUCLEIC_BASES.include? s}
  puts "ERROR: The input sequence contains characters which are not ACGTU"
  exit 1
end

rna = true if sequence_arr.any? {|s| s == "U"}
dna = true if sequence_arr.any? {|s| s == "T"}

if rna and dna
  puts "ERROR: The input sequence contains both 'U' and 'T'."
  exit 1
end


if rna
  puts sequence.rna_complement
else
  puts sequence.dna_complement
end
