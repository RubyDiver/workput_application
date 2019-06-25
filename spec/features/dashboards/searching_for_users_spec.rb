require 'rails_helper'

RSpec.feature "Searching users" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "joh@example.com", password: "password")
    @tim = User.create!(first_name: "tim", last_name: "Doe", email: "tim@example.com", password: "password")
  end

  scenario "with existing name returns all those users" do
    visit "/"

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@tim.full_name)
    expect(current_path).to eq("/dashboards/search")
  end
end