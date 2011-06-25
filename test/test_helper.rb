require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group  'Libraries', 'lib'
end

require 'minitest/autorun'
require 'purdytest'

require 'list'

