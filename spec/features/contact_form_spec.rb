require 'spec_helper'

feature "Contact Form" do
  before :each do
    ss = StyleSeat.new
    ss.title = "Kat Park, Stylist"
    ss.street_address = "17849 Santiago Blvd"
    ss.city = "Villa Park"
    ss.state = "CA"
    ss.zip_code = "92861"
    ss.phone_number = "714-637-4845"
    ss.image = "https://d220aniogakg8b.cloudfront.net/static/uploads/2012/12/21/440f0b34-582_519437_300x300.jpg"
    ss.save
  end

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

  scenario "current Style Seat information on contact page" do
    visit "/"
    click_link "Contact"
    within("h5") do
      page.should have_content("Kat Park, Stylist")
    end
  end
end
