require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @ted = User.create(first_name: "ted", last_name: "teddy", email: "ted@example.com", password: "password")
    @tim = User.create(first_name: "Tim", last_name: "ready", email: "tim@example.com", password: "password")
    login_as(@ted)

    @e1 = @ted.exercises.create(duration_in_min: 100,
                                workout: 'My body building activity',
                                workout_date: Date.today)

    @e2 = @tim.exercises.create(duration_in_min: 30,
                                workout: 'tabata',
                                workout_date: 2.days.ago)

    @following = Friendship.create(user: @ted, friend: @tim)

  end
  scenario "shows friend's workout for last 7 days" do
  visit "/"

    click_link "My Lounge"
    click_link @tim.full_name

    expect(page).to have_content(@tim.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")

  end
end