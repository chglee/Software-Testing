require 'watir'
require 'colorize'
require 'spreadsheet'

# file = ARGV[0]
# book = Spreadsheet.open('C:\Users\Admin\Desktop\Software testing\Seminal\features\data\data.xls')
# sheet= book.worksheet(0)
browser = Watir::Browser.new

Given(/^I am on the BSmartSchool login page$/) do
  browser.goto "https://crm.bsmart.city/vi/web/login"
end

When(/^enter Username\/Email and Password for login$/) do
  browser.text_field(name: "login").set("ldchuong@apcs.vn")
  browser.text_field(name: "password").set("duychuong1398")

  browser.button(type: "submit").click
end

Then(/^Proceed to homepage$/) do
  log("Successfully login")
  browser.close
end

Given(/^I am on the BSmartSchool login page again$/) do
  browser = Watir::Browser.new
  browser.goto "https://crm.bsmart.city/vi/web/login"
end
When(/^enter valid Password but enter invalid Username$/) do
  browser.text_field(name: "login").set("abcd")
  browser.text_field(name: "password").set("duychuong1398")

  browser.button(type: "submit").click
end

Then(/^Error message show$/) do
  if (browser.text.include? "Sai tên đăng nhập/mật khẩu" )
    log("Sai tên đăng nhập/mật khẩu")
  else
    log("Passed but test failed")
  end
  browser.close
end