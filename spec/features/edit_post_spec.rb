require 'spec_helper'

feature "Edit Post" do
  let!(:admin) { Factory(:admin) }
  let!(:post) { Factory(:post) }


  before each: do
    visit "/admin"
    sign_in_as!(admin)
    click_link "edit"
  end

  scenario "admin can edit posts" do
    fill_in "Title" with: "Edited Title"
    fill_in "Body" with: "Edited body."
    click_button "Edit Post"
  end
end
