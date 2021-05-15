require 'watir'
require 'colorize'
require 'spreadsheet'

# file = ARGV[0]
book = Spreadsheet.open('C:\Users\Admin\Desktop\Software testing\BSmartSchool\features\Data\Data.xls')
sheet= book.worksheet(0)
browser = Watir::Browser.new

Given(/^I am on the CRM module and going to fill valid infor$/) do
  # browser.goto "https://crm.bsmart.city/vi/web/login"
  browser.goto "https://crm.bsmart.city/web#action=171&model=crm.lead&view_type=kanban&cids=1&menu_id=121"
  browser.text_field(name: "login").set("ldchuong@apcs.vn")
  browser.text_field(name: "password").set("duychuong1398")
  browser.button(type: "submit").click
end

When(/^Fill all information to create new opportunity$/) do
  browser.span(visible_text:"Create").click
  row = sheet.row(0)
  browser.text_field(name: "name").set(row[0])
  browser.text_field(id: "o_field_input_128").set(row[1])
  # browser.send_keys :enter
  browser.text_field(name: "planned_revenue").set(row[2])
  browser.radio(label: row[3]).set
end

Then(/^I should see Passed message$/) do
  if (browser.alert.present? == true )
    log(browser.alert.text)
  else
    log("Passed")
  end
  browser.close
end