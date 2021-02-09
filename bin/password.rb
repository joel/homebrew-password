#!/usr/bin/env ruby

require_relative '../lib/password.rb'

begin
  require 'pry'
rescue LoadError
end


# Generate a password
# bin/password --generate --no-symbol --length=10

encryptor = Password::Ui.new
password = encryptor.convert

puts password
