require 'spec_helper'

feature "Image Upload" do
  let!(:admin) { Factory(:admin) }

  before :each do
    visit "/admin"
    sign_in_as!(admin)
    click_link "Images"
  end

  scenario "admin can upload an image" do
    attach_file "Image #1", File.expand_path("spec/fixtures/image1.jpg")
    click_button "Upload Image"
    page.should have_content("Image has been uploaded.")
    page.should have_content("image1.jpg")
  end

  scenario "admin can't upload an empty image" do
    click_button "Upload Image"
    page.should have_content("There was a problem uploading the image.")
    page.should have_content("Image #1")
  end
end
