# ww coding challenge
# by Xiao Meng Wei
# Jan 20 2019
#
# Question 2:
#
# Write an automated test for this scenario using WebDriver.
# The following exercise does not require user login. Please use ID or class as selectors.
#
# Steps:
# 1. Navigate to https://www.weightwatchers.com/us/
# 2. Verify loaded page title matches “WW (Weight Watchers): Weight Loss & Wellness Help”
# 3. On the right corner of the page, click on “Find a Studio”
# 4. Verify loaded page title contains "Find a Studio & Meeting Near You | WW USA"
# 5. In the search field, search for studios for zip code: 10011
# 6. Print the title of the first result and the distance
# 7. Click on the first search result and you should see names of the person conducting the meeting on the scheduled time right under time for each day. Create a method that would take a weekday as parameter e.g. Sun, Mon, Tue....Sat and the method should print out the names(s) and the number of times each person(s) is conducting the meeting that particular day.
#
# e.g.
# getScheduleSummary(Sun)
# output should be:
# Name: <XXXXX> Total: <XX> times
# Name: <YYYYY> Total: <YY> times
#

# Note:
# page objects, test data, and test case should be in separate files
# this test case is combined into 2 files to simplify structure

require 'watir'
require_relative 'page_base'

# custom test util functions
# had to implement this due to not using framework such as rspec
# this is a simplification of the corresponding rspec functions

def testAssert(message, test, assertion)
  puts message
  if test != assertion
    puts "!!! Assertion Failed !!!"
    puts "On page text \"" + "#{test}" + "\" does not match #{assertion}"
  else
    puts "... Assertion Passed ..."
  end
end

# initialize objects and data needed for the test
# in reality this could be read from external files

$browser = Watir::Browser.new :chrome
@page = PageBase.new
@data = {
    :title1 => "WW (Weight Watchers): Weight Loss & Wellness Help",
    :title2 => "Find a Studio & Meeting Near You | WW USA",
    :css1 => ".menu-link-find-a-studio",
    :css2 => "#meetingSearch",
    :css3 => ".meeting-locations-list__item:first-of-type",
    :css4 => ".btn.spice-translated",
    :css5 => ".schedule-detailed-day-label",
    :text1 => "10011",
    :text2 => "Thu"
}

# beginning of test case
@page.go_home
testAssert("Verifying first page title", @page.title, @data[:title1])
@page.click(@data[:css1])
testAssert("Verifying second page title", @page.title, @data[:title2])
@page.enter_text(@data[:css2], @data[:text1])
@page.click(@data[:css4])
@page.print_first_result(@data[:css3])
@page.click(@data[:css3])
@page.getScheduleSummary(@data[:text2], @data[:css5])
# end of test case