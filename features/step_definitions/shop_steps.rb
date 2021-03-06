When(/^I enter (.*) as the search term$/) do |search_string|
  @search_word = search_string
  shop_page.search_suggestions_for(@search_word)
  hide_soft_keyboard
end

Then(/^I touch the "(.*?)" button$/) do |button_name|
  shop_page.goto_category(button_name)
end

Then(/^I should see search suggestions$/) do
  expect(shop_page.search_suggestions).to be_visible
end

Then(/^I should see the shop page$/) do
  expect_page(shop_page)
end

And(/^I navigate back until I get to the My Library page$/) do
  navigate_back_until_my_library_page_present
end

Then(/^I should see (.+) in the search suggestions$/) do |search_string|
  expect(shop_page.search_results).to include(search_string)
end

Then(/^I can verify that the there is a Highlights area$/) do
  expect(shop_page).to have_highlights_section
end