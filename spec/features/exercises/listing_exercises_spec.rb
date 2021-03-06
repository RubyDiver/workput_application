require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @ted = User.create(first_name: "ted", last_name: "teddy", email: "ted@example.com", password: "password")
    @tim = User.create(first_name: "Tim", last_name: "ready", email: "tim@example.com", password: "password")
    login_as(@ted)

    @e1 = @ted.exercises.create(duration_in_min: 100,
                                workout: 'My body building activity',
                                workout_date: Date.today)

    @e2 = @ted.exercises.create(duration_in_min: 30,
                                workout: 'tabata',
                                workout_date: 2.days.ago)

    @following = Friendship.create(user: @ted, friend: @tim)

    # @e3 = @ted.exercises.create(duration_in_min: 50,
    #                             workout: 'push-ups',
    #                             workout_date: 8.days.ago)
  end

  scenario "show user's workout for last 7 days" do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

    # expect(page).not_to have_content(@e3.duration_in_min)
    # expect(page).not_to have_content(@e3.workout)
    # expect(page).not_to have_content(@e3.workout_date)

  end

  scenario "shows no exercise if none created" do
    @ted.exercises.delete_all

    visit "/"

    click_link "My Lounge"
    expect(page).to have_content("No Workouts Yet")
  end

  scenario "shows a list of user's friends" do
    visit "/"

    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@tim.full_name)
    expect(page).to have_link("Unfollow")
  end
end