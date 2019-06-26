require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @ted = User.create!(first_name: "ted", last_name: "teddy", email: "ted@example.com", password: "password")
    @tim = User.create!(first_name: "Tim", last_name: "ready", email: "tim@example.com", password: "password")
    @harry = User.create!(first_name: "Harry", last_name: "Potter", email: "harry@example.com", password: "password")

    @room_name = @ted.first_name + '-' + @ted.last_name
    @room = Room.create!(name: @room_name, user_id: @ted.id)

    login_as(@ted)

    Friendship.create(user: @tim, friend: @ted)
    Friendship.create(user: @harry, friend: @ted)
  end
  scenario "to followers shows in chatroom window" do
    visit "/"

    click_link "My Lounge"
    expect(page).to have_content(@room_name)

    fill_in "message-field", with: "Hello"
    click_button "Post"

    expect(page).to have_content("Hello")

    within('#followers') do
      expect(page).to have_link(@tim.full_name)
      expect(page).to have_link(@harry.full_name)
    end
  end
end
