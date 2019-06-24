require 'rails_helper'

RSpec.feature "Editing Exercise" do
  before do
    @max = User.create(email: "max@example.com", password: "password")

    @max_exercise = @max.exercises.create!(duration_in_min: 100,
                                workout: 'My body building activity',
                                workout_date: Date.today)

    login_as(@max)
  end

  scenario "with valid data succeeds" do
    visit "/"

    click_link "My Lounge"

    path = "/users/#{@max.id}/exercises/#{@max_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(100)
  end
end