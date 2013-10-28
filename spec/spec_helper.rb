require 'capybara/rspec'
require 'capybara-webkit'
Capybara.javascript_driver = :webkit
Capybara.app_host = "https://demo.wellvize.com"

RSpec.configure do |config|
  config.include Capybara::DSL
end