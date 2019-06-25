require 'rails_helper'

RSpec.feature "Following Friends" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "joh@example.com", password: "password")
    @tim = User.create!(first_name: "tim", last_name: "Doe", email: "tim@example.com", password: "password")
    login_as(@john)
  end
  scenario "if signed in" do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@tim.full_name)

    href = "/friendships?friend_id=#{@john.id}"
    expect(page).not_to have_link("Follow", :href => href)

    link = "a[href='/friendships?friend_id=#{@tim.id}']"
    find(link).click

    href = "/friendships?friend_id=#{@tim.id}"
    expect(page).not_to have_link("Follow", :href => href)
  end
end
