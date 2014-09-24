require 'sparklines'
require 'base64'
require 'csv'


def generate_sparkline(data, options = {:type => 'smooth'})
  create_sparkline { Sparklines.plot(data, options ) }
end

def write_to_html(sparkline, ticker, message)
  open 'google.html', 'a' do |f|
    f << "#{ticker} (#{sparkline}) #{message} <br/>"
  end
end

def create_sparkline
  %{<img src="data:image/png;base64,#{Base64.encode64(yield)}"/>}
end

google = CSV.read('table.csv', headers: true)
close =  google.collect { |x| x['Close'].to_i }

sparkline = generate_sparkline(close)
ticker = 'NYSE: GOOG'

write_to_html(sparkline, ticker, 'Closing Stock Price')