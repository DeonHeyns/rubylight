require 'rexml/document'

include REXML

file = File.read('export.xml')
doc = Document.new(file)

puts file