require 'spec_helper'

feature "Create Post" do

  scenario "admin add new post" do
    visit '/admin'
    click_link 'New Post'
    fill_in 'Title', with: "Hello World"
    fill_in 'Body', with: "This is a new post."
    click_button "Create Post"
    page.should have_content("New post created successfully.")
    visit '/'
    click_link 'Blog'
    page.should have_content("Hello World")
  end
end
