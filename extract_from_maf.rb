#!/usr/bin/env ruby -wKU

# This script will extract only the desired species from multiz multi-way alignments.

puts "Usage: extract_from_maf.rb directory" unless ARGV.length == 1

directory = ARGV[0]


SPECIES = ["hg19", "rheMac2", "canFam2"]

entries = Dir.entries(directory).select {|e| e =~ /\.maf$/}

for filename in entries
  puts "Extracting #{filename}"
  output_filename = filename.gsub(".maf", "3way.#{SPECIES.join(".")}.maf")
  File.open(directory + "/" + filename, "r") do |input|
    File.open(directory + "/" + output_filename, "w") do |out|
      input.each_line do |line|
        if line.chomp == ""
          out.print line
          next
        end
        specie_token = line.split(/\w/)[1]
        next if specie_token.nil?
        next unless SPECIES.any? {|s| specie_token.include? s }
        out.print line
      end
    end
  end
end