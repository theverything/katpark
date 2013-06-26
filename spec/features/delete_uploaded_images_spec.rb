require 'spec_helper'

feature "Delete Images" do
  let!(:admin) { Factory(:admin) }

  scenario "admin can delete uploaded images" do
    visit "/admin"
    sign_in_as!(admin)
    click_link "Upload Image"
    attach_file "Image #1", File.expand_path("spec/fixtures/image1.jpg")
    click_button "Upload Image"
    click_link "Delete"
    page.should have_content("Image has been deleted.")
    page.should_not have_content("image1.jpg")
  end
end
