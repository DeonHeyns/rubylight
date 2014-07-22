array = File.read('file.csv').split(',').map(&:strip)
puts array