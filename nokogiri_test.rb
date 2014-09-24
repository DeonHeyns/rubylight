require 'nokogiri'

f = File.open("purchase_order.xml")
doc = Nokogiri::XML(f)

shipping_address = doc.xpath("/PurchaseOrder/Address[@Type='Shipping']")

details = <<EOM
#{shipping_address.xpath('Name/text()')}
#{shipping_address.xpath('Street/text()')}
#{shipping_address.xpath('City/text()')}
#{shipping_address.xpath('State/text()')}
#{shipping_address.xpath('Zip/text()')}
#{ shipping_address.xpath('Country/text()')}
EOM

puts details