#!/usr/bin/env ruby
require 'set'

def caps(str)
  caps_count = 0
  str.chars.each { |c| caps_count += 1 if c >= 'A' && c <= 'Z' }
  str.length > 0 ? caps_count.to_f / str.length.to_f : -1
end

def vowels_consonants(str)
  lc_consonants = Set.new ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','z']
  lc_vowels = Set.new ['a','e','i','o','u','y']
  consonants = lc_consonants + lc_consonants.map {|c| c.upcase}
  vowels = lc_vowels + lc_vowels.map {|c| c.upcase}
  str_consonants = ""
  str_vowels = ""
  str.chars.each_index do |c| 
    if consonants.include?(str.chars[c]) then
      str_consonants = str_consonants + str.chars[c]
    elsif vowels.include?(str.chars[c])
      str_vowels = str_vowels + str.chars[c]
    end
  end
  str_consonants.length > 0 ? (str_vowels.length.to_f / str_consonants.length.to_f) : -1
end
def alpha(str)
  str.chars.to_set.size 
end

ARGF.each_line do |str|
  str = str.chomp.lstrip
  unless str.index('\s')
    puts "\"#{str}\", #{str.length}, #{alpha(str)}, #{vowels_consonants(str)}, #{caps(str)}"
  end
end
