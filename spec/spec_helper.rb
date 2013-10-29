require 'capybara/rspec'
require 'capybara-webkit'
Capybara.javascript_driver = :webkit
Capybara.app_host = "https://your.awesome-site.com"

require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end
