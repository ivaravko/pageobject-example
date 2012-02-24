# encoding: utf-8
##
# @author Igor Varavko <i.varavko@co.wapstart.ru>
# @copyright Copyright (c) 2012, Wapstart
##

class LoginPage
	include PageObject

	page_url "http://www.passport.wapstart.ru/login/"

	text_field(:login, :name => 'name')
	text_field(:password, :name => 'password')
end