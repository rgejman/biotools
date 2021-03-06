#!/usr/bin/env ruby -KU

# A little tool to convert the concentration measures in grams/volume to molarity for ds nucleic acids.
# Why? Because concentration measurement tools (such as nanodrops) return values in ng/ul, which is typically not convenient for subsequent calculation.
# Dependencies: rubygems and ruby-units

require 'rubygems'
require 'ruby-units'

if ARGV.length != 4
  puts "Convert concentration (xg/xl) to molarity (xM) of dsNucleic acids with known lengths."
  puts "e.g. concentration_to_molarity.rb 20 ng/ul 500 nM => 78.7879 nM"
  exit
end

avg_g_mol_bp  = 660
value           = ARGV[0]
concentration   = ARGV[1]
length          = ARGV[2].to_i
final_molarity  = ARGV[3]


s = value + " " + concentration
length *= avg_g_mol_bp
mm = Unit.new("#{length} g/mol")
s = s.to_unit

puts s/mm >> final_molarity