require 'rails_helper'

RSpec.feature "Signing in" do
  before do
    @john = User.create(first_name: "john", last_name: "Doe", email: "john@example.com", password: "password")
  end

  scenario "with valid credential" do

    visit "/"

    click_link "Sign in"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).not_to have_link("Sign up")
    expect(page).not_to have_link("Sign in")
  end

  # scenario "With invalid credential" do
  #   visit "/"
  #
  #   click_link "Sign in"
  #   fill_in "Email", with: ""
  #   fill_in "Password", with: ""
  #
  #   click_button "Sign in"
  #
  #   expect(page).to have_content("You have signed in succesfully.")
  # end
end