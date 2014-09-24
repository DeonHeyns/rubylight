require 'RMagick'
include Magick

image = Image.read('cat.png').first
puts image.format

image.write('cat.png')

image = Image.read('cat.png').first
puts image.format
