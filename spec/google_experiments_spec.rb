require 'spec_helper'

describe "Testing a Google Experiment", js: true do
  # # Verify we're hitting the home page
  # it "should access the page" do
  #   visit '/'
  #   page.should have_selector "a[href='/users/sign_up']"
  # end

  it "should follow the sign_up link" do
    visit '/'
    first("a[href='/users/sign_up']").click
    binding.pry
    page.should have_selector "input#user_first_name"
  end
end