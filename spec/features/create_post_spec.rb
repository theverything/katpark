require 'spec_helper'

feature "Create Post" do
  let!(:admin) { Factory(:admin) }

  before :each do
    visit '/admin'
    sign_in_as!(admin)
    click_link 'New Post'
  end

  scenario "admin add new post" do
    fill_in 'Title', with: "Hello World"
    fill_in 'Body', with: "This is a new post."
    click_button "Create Post"
    page.should have_content("New post created successfully.")
    visit '/'
    click_link 'Blog'
    page.should have_content("Hello World")
    page.should have_content("This is a new post.")
  end

  scenario "admin can't add new post without title" do
    fill_in 'Title', with: ""
    fill_in 'Body', with: "This is a new post."
    click_button "Create Post"
    page.should have_content("There was an error creating your post.")
  end

  scenario "admin can't add new post without body" do
    fill_in 'Title', with: "Hello World"
    fill_in 'Body', with: ""
    click_button "Create Post"
    page.should have_content("There was an error creating your post.")
  end
end
