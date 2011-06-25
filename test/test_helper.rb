require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group  'Libraries', 'lib'
end

require 'minitest/autorun'

# colorize test output
require 'purdytest'
Purdytest.configure do |io|
  io.pass  = :cyan
  io.error = :magenta
  io.fail  = :magenta
end

require 'list'

