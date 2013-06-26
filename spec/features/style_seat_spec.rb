require 'spec_helper'

feature "Style Seat" do

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

  scenario "current information on contact page" do
    visit "/"
    click_link "Contact"
    within("h5") do
      page.should have_content("Kat Park, Stylist")
    end
  end
end
