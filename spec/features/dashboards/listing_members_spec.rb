require 'rails_helper'

RSpec.feature "Listing members" do
  before do
    @max = User.create(first_name: "max", last_name: "truck", email: "max@example.com", password: "password")
    @tim = User.create(first_name: "tim", last_name: "buchalka", email: "tim@example.com", password: "password")
  end

  scenario "show a list of registered members" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@max.full_name)
    expect(page).to have_content(@tim.full_name)
  end
end