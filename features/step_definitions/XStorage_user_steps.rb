Then(/^I should see some "([^"]*)" listings$/) do |arg|
  pending
end

Given(/^The StorageX has following listings$/) do |table|
  table.rows().each do |listing|
  # table is a table.hashes.keys # => [:storage_id, :address, :zipcode, :daily_price, :email]
    Listing.create(:storage_id => listing[0], :address => listing[1], :zipcode => listing[2], :daily_price => listing[3], :email => listing[4])
  end
end

And(/^I am in the "([^"]*)" page$/) do |arg|
  if arg == 'listing index'
    visit "/listings"
  end
end

When(/^I search listings with invalid zip code \- "([^"]*)"$/) do |zipcode|
  # pending
  fill_in('listing[zipcode]', :with => zipcode)
  click_button('Filter')
end

When(/^I search listings with valid zip code \- "([^"]*)"$/) do |zipcode|
  fill_in('listing[zipcode]', :with => zipcode)
  click_button('Filter')
end


Then(/^I should see (\d+) records$/) do |number_of_rows|
  actual_number = page.all('#listing_table tr').size
  actual_number == (number_of_rows + 1)
end

When(/^I click the "([^"]*)" column$/) do |col|
  if Listing::sym2name.include?col
    click_link(Listing::sym2name[col.to_sym])
  else
    "Error: Listing Index page don't have the column that supports sorting."
  end
end

Then(/^I need to see the listings indexed by "([^"]*)"$/) do |col|
  pending
end