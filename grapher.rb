require 'gruff'
require 'csv'

google = CSV.read('table.csv', headers: true)

x_axis = []
google.each { |row|  x_axis << row['Date'] }

start_date = x_axis.min
middle_date = x_axis[(x_axis.length ) / 2]
end_date = x_axis.max


graph = Gruff::Line.new(600)
graph.title = 'Google 6 month Historical Stock Price'

graph.data('Open', google.collect { |x| x['Open'].to_i }, '#B75582')
graph.data('High', google.collect{ |x| x['High'].to_i }, '#79C65B' )
graph.data('Low', google.collect { |x| x['Low'].to_i })
graph.data('Close', google.collect { |x| x['Close'].to_i })

graph.labels = { 0 => start_date, 50 => middle_date, 100 => end_date }
graph.x_axis_label = 'Date'
graph.y_axis_label = 'Dollars'

graph.write('google_stock.png')

