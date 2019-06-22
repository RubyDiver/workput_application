require 'rails_helper'

RSpec.feature "Signing out" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "john@example.com"
    fill_in "Password",with: "password"
    click_button "Sign in"
  end

  scenario "User signing out" do
    visit "/"

    click_link "Sign out"

    expect(page).to have_content("You have Signed out successfully.")
    expect(page).not_to have_link("Sign out")
  end

end
