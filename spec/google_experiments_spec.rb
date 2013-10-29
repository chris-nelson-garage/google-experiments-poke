require 'spec_helper'

VERBOSE = false # enable debug logging

class VisitCounter
  attr_reader :visits, :clicks
  def initialize
    @visits = @clicks = 0
  end

  def visit; @visits += 1; end

  def click; @clicks += 1; end
end

class TotalCounter
  class << self
    def inc
      @count ? @count += 1 : @count = 1
    end

    def count
      @count || 0
    end
  end
end

def click_the_link(version, visit_counter, link_target)
  first("a[href='#{link_target}']").click
  visit_counter.click
  puts "clicked #{version}" if VERBOSE
end

describe "Testing a Google Experiment", js: true do
  let(:link_target) { '/users/sign_up' }
  let(:variant_1_tag) { 'free_trial' }
  let(:variant_1_click_rate) { 70 }
  let(:original_click_rate) { 50 }

  before(:all) do
    @variant_1_counter = VisitCounter.new
    @original_counter = VisitCounter.new
    @total = TotalCounter
  end

  after(:all) do
    puts "Variant 1 clicked #{@variant_1_counter.clicks} times out of #{@variant_1_counter.visits}"
    puts "Original clicked #{@original_counter.clicks} times out of #{@original_counter.visits}"
    puts "#{@total.count} visits overall."
  end

  # # Verify we can find the link to hit
  # it "should access the page" do
  #   visit '/'
  #   page.should have_selector "a[href='#{link_target}']"
  # end

  30.times do
    it "completes a test cycle" do
      visit '/'

      puts page.current_url if VERBOSE

      if page.current_url.include?(variant_1_tag)
        @variant_1_counter.visit
        if rand(100) < variant_1_click_rate
          click_the_link('variant 1', @variant_1_counter, link_target)
        end
      else
        @original_counter.visit
        if rand(100) < original_click_rate
          click_the_link('original', @original_counter, link_target)
        end
      end

      @total.inc
    end
  end
end