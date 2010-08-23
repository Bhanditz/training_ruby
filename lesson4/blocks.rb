#!/usr/bin/env ruby
# Illustrates how different use of blocks in ruby

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'set'

birches = ['Betula alleghaniensis','Betula alnoides',
'Betula ermanii','Betula glandulosa','Betula kenaica','Betula lenta',
'Betula nana','Betula nigra','Betula occidentalis','Betula papyrifera',
'Betula pendula','Betula platyphylla','Betula populifolia','Betula pubescens',
'Betula schmidtii','Betula utilis']


def wiki_search(an_array) 
  url = 'http://en.wikipedia.org/wiki/'
  not_found = 'Wikipedia does not have an article'
  errors = []
  an_array.each do |b|
    response = open(url + b.strip.gsub(/\s+/,"_")).readlines.join(" ") rescue (errors << b; next)
    hr = Nokogiri::HTML(response) 
    wiki_res = hr.xpath('//p').first.text
    if block_given?
      yield(b,wiki_res) if wiki_res[0...34] != not_found
    else
     puts wiki_res
    end
  end
  errors
end

wiki_birches = {}

puts "\nFind all birches in wikipedia"
errors = wiki_search(birches) {|species,wr| puts wr + "\n\n" ; wiki_birches[species] = wr}
puts wiki_birches.keys.join("; ")

puts "\nHave not been found: " + errors.join("; ")

puts "\nFind all European Birches"
europe_birches = wiki_birches.keys.select {|b| wiki_birches[b].match /Europe/}
puts europe_birches.join("; ")

puts "\nFind American and non American birches"
american_birches, nonamerican_birches = wiki_birches.keys.partition {|b| wiki_birches[b].match /America/}
puts "\nAmerican Birches: " + american_birches.join("; ")
puts "\nOther Birches: " + nonamerican_birches.join("; ")

puts "\nHow many words are in all paragraphs"
words = wiki_birches.values.inject(0) {|res, data| res += data.split(/\s+/).size}
puts words

puts "\nDo we have only birch species?"
puts wiki_birches.keys.all? {|b| b.match /Betula/}

puts "\nDo we have any 'nana' species?"
puts wiki_birches.keys.any? {|b| b.match /nana/}

puts "\nSort in reverse order by second word in species name"
puts wiki_birches.keys.sort {|a,b| b.split[1] <=> a.split[1]}

puts "\nMake all words downcase, find unique words and sort them"
puts wiki_birches.keys.map {|b| b.downcase}.join(" ").split(" ").to_set.to_a.sort.join(" ")

puts "\nGrabbing output from a block"
def even_nums(an_array) 
  an_array.each do |a|
    if a % 2 == 0
      result=yield(a)
      puts a.to_s + "->" + result.to_s
    end
  end
end
even_nums([1,334,3,555,32,1134,-33]) {|n| n - 1001}


