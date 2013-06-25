require 'spec_helper'

feature "Edit Post" do
  let!(:admin) { Factory(:admin) }
  let!(:post) { Factory(:post) }

  before :each do
    visit "/admin"
    sign_in_as!(admin)
    click_link "Edit"
  end

  scenario "admin can edit posts" do
    fill_in "Title", with: "Edited Title"
    fill_in "Body", with: "Edited body."
    click_button "Update Post"
    page.should have_content("Post updated successfully.")
    visit "/"
    click_link "Blog"
    page.should have_content("Edited Title")
    page.should have_content("Edited body.")
  end

  scenario "admin can edit featured posts" do
    fill_in "Title", with: "Edited Title"
    fill_in "Body", with: "Edited body."
    check 'post_featured'
    click_button "Update Post"
    page.should have_content("Post updated successfully.")
    visit "/"
    page.should have_content("Edited Title")
    page.should have_content("Edited body.")
  end

  scenario "admin can't edit post without title" do
    fill_in 'Title', with: ""
    fill_in 'Body', with: "This is a new post."
    click_button "Update Post"
    page.should have_content("There was an error updating your post.")
  end

  scenario "admin can't edit post without body" do
    fill_in 'Title', with: "Hello World"
    fill_in 'Body', with: ""
    click_button "Update Post"
    page.should have_content("There was an error updating your post.")
  end
end
