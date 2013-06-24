require 'spec_helper'

feature "Delete Post" do
  let!(:admin) { Factory(:admin) }
  let!(:post) { Factory(:post) }

  scenario "admin can delete a post" do
    visit '/admin'
    sign_in_as!(admin)
    click_link "Delete"
    page.should have_content("Post was deleted.")
    visit '/'
    click_link "Blog"
    page.should_not have_content("Hello World")
  end
end
