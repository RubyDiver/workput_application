require 'rails_helper'

RSpec.feature "Creating home page" do
  scenario do
    visit "/"

    click_link "Home"
    click_link "Athletes Den"
    expect(page).to have_content("Workout Lounge!")
    expect(page).to have_content("Show off your workout")
  end
end