# encoding: utf-8
##
# @author Igor Varavko <i.varavko@co.wapstart.ru>
# @copyright Copyright (c) 2012, Wapstart
##
 require 'page-object'
 require 'selenium/webdriver'
 require_relative '../lib/LoginPage'

 class RegistrationPage
 	include PageObject

 	page_url "http://www.passport.wapstart.ru/registration/"

 	DEFAULT_DATA = {
 		'email' => 'habrahabr@gmail.com',
 		'password' => 'qwerty',
		'source' => 'Прочитал статью, новость о WapStart' 		
 	}

 	text_field(:email, :name => 'mail')
 	text_field(:password, :id => 'hidden-password')
 	checkbox(:showPassword, :id => 'showPassword')
 	select_list(:source, :name => 'informationSource')
 	text_field(:fio, :name => 'fio')
 	text_field(:phone, :name => 'phone')
 	select_list(:purpose, :name => 'registrationPurpose')
 	checkbox(:haveCode, :id => 'havePartnerCode')
 	text_field(:code, :id => 'plus1PartnerCode')
 	checkbox(:agreement, :name => 'agreement')
 	button(:register, :name => "register")

 	# Exception
 	span(:errorCode, :xpath => "//form[@id='registrationForm']/table/tbody/tr[9]/td[2]/span/span[2]")

 	def default(data = {})
 		data = DEFAULT_DATA.merge(data)
 		self.email = data['email']
 		self.password = data['password']
 		self.source = data['source']
 		check_agreement
 		register
 		LoginPage.new(browser, true)
 	end
 end