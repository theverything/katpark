require 'spec_helper'

feature "Contact Form" do

  scenario "user adds information" do
    visit '/'
    click_link "Contact"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john@doe.com"
    fill_in "Phone Number", with: "7145551234"
    fill_in "City", with: "Walnut"
    fill_in "Message", with: "This is a message."
    click_button "Submit"
  page.should have_content("Your message has been sent.")
  end
end
