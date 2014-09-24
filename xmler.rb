require 'crack'
require 'crack/xml'

purchase_order = Crack::XML.parse(File.read('purchase_order.xml'))
billing_address = purchase_order['PurchaseOrder']['Address'].find { |address| address['Type'] == 'Shipping' }

details = <<EOM
#{billing_address["Name"]}
#{billing_address["Street"]}
#{billing_address["City"]}
#{billing_address["State"]}
#{billing_address["Zip"]}
#{billing_address["Country"]}
EOM

puts details

