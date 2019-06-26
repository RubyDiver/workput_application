require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @ted = User.create(first_name: "ted", last_name: "teddy", email: "ted@example.com", password: "password")
    @tim = User.create(first_name: "Tim", last_name: "ready", email: "tim@example.com", password: "password")
    login_as(@ted)

    @following = Friendship.create(user: @ted, friend: @tim)

  end
  scenario do
    visit "/"

    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@tim.full_name + " unfollowed")
  end
end