require 'rexml/document'

include REXML

file = File.open('purchase_order.xml')
doc = Document.new(file)

shipping_address = XPath.first(doc, "/PurchaseOrder/Address[@Type='Shipping']")
values = shipping_address.elements.map { |element| element.text }
puts values