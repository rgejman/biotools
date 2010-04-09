#!/usr/bin/env ruby -wKU

# This script will extract only the desired species from multiz multi-way alignments.

puts "Usage: extract_from_maf.rb directory" unless ARGV.length == 1

directory = ARGV[0]


SPECIES = ["hg19", "rheMac2", "canFam2"]

entries = Dir.entries(directory).select {|e| e =~ /\.maf$/}

for filename in entries
  puts "Extracting #{filename}"
  File.open(directory + "/" + filename, "r") do |input|
    output_filename = filename.gsub(".maf", ".3way.#{SPECIES.join(".")}.maf")
    File.open(directory + "/" + output_filename, "w") do |out|
      input.each_line do |line|
        tokens = line.split("\s")
        next if tokens.empty? or tokens.length < 2
        puts tokens[1]
        next unless SPECIES.any? {|s| tokens[1].include? s }
        out.print line
      end
    end
  end
end