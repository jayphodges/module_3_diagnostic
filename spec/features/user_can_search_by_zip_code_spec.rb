require 'rails_helper'

# As a user
feature "as a user" do

  scenario "user visits root and enters zip" do
  # When I visit "/"
  visit "/"
  # And I fill in the search form with 80203
  fill_in 'q', with: "80203"
  # And I click "Locate"
  click_on("Locate")
  # Then I should be on page "/search" with parameters visible in the url
  expect(page).to have_current_path(search_path(q: '80203'))
  # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
  expect(page).to have_content(10)
  # And the stations should be limited to Electric and Propane
  expect(page).not_to have_content("Gasoline")
  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
