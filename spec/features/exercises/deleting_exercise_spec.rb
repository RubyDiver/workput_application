require 'rails_helper'

RSpec.feature "Deleting Exercise" do
  before do
    @max = User.create(email: "max@example.com", password: "password")

    @max_exercise = @max.exercises.create!(duration_in_min: 100,
                                           workout: 'My body building activity',
                                           workout_date: Date.today)

    login_as(@max)
  end
  scenario "with valid succeeds"
  visit "/"

  click_lick "My Lounge"

  path = "/users/#{@max.id}/exercises/#{@max_exercise.id}"
  link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"

  find(:xpath, link).click

  expect(page).to have_content("Exercise has been deleted")
end