# encoding: utf-8
##
# @author Igor Varavko <i.varavko@co.wapstart.ru>
# @copyright Copyright (c) 2012, Wapstart
##
require_relative '../lib/RegistrationPage'

describe "RegisterUser" do
	let(:browser) { @browser ||= Selenium::WebDriver.for :ff } #Initialize new instance of Browser(driver)

	it "InvalidCode" do
		page = RegistrationPage.new(browser, true)
		page.email = 'habrahabr@gmail.com'
		page.password = 'qwerty'
		page.source = 'Прочитал статью, новость о WapStart'
		page.check_haveCode
		page.code = 12345678
		page.check_agreement
		page.register
		page.errorCode?.should be_true
	end

	after { browser.close }
end