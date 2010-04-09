#!/usr/bin/env ruby -wKU

# This script will extract only the desired species from multiz multi-way alignments.

puts "Usage: extract_from_maf.rb directory" unless ARGV.length == 1

directory = ARGV[0]


SPECIES = ["hg19", "rheMac2", "canFam2"]

entries = Dir.entries(directory).select {|e| e =~ /\.maf$/}

for filename in entries
  puts "Extracting #{filename}"
  output_filename = filename.gsub(".maf", "3way.#{SPECIES.join(".")}.maf")
  File.open(filename, "r") do |in|
    File.open(output_filename, "w") do |out|
      in.each_line do |line|
        specie_token = line.split(/\w/)[1]
        next unless SPECIES.any? {|s| specie_token.include? s }
        out.print line
      end
    end
  end
end