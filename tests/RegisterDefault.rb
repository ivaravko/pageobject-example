# encoding: utf-8
##
# @author Igor Varavko <i.varavko@co.wapstart.ru>
# @copyright Copyright (c) 2012, Wapstart
##
require_relative '../lib/RegistrationPage'
require_relative '../lib/LoginPage'
 
browser = Selenium::WebDriver.for :ff
registration_page = RegistrationPage.new(browser, true)
registration_page.default