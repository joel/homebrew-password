#!/usr/bin/env ruby

require_relative '../lib/password.rb'

require 'pry'

# Generate a password
# bin/password --generate --no-symbol --length=10

encryptor = Password::Ui.new
password = encryptor.convert

puts password
