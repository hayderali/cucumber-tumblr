require 'watir'
require 'rspec/expectations'
require 'pry'
require 'cucumber'

Dir["../pages/*_page.rb"].each {|file| require file}
