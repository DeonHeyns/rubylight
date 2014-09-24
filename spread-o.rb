require 'axlsx'

package = Axlsx::Package.new
workbook = package.workbook

workbook.add_worksheet(:name => 'Profit vs Loss') do |sheet|
  sheet.add_row %w(income expense)
  sheet.add_row [1000, 988]
  sheet.add_row [1200, 877]
  sheet.add_row [3010, 198]
  sheet
end

package.serialize('profit.xlsx')