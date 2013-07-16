require 'spec_helper'

feature "Contact Form" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let!(:styleseat) do
    ss = StyleSeat.new
    ss.title = "Kat Park, Stylist"
    ss.street_address = "17849 Santiago Blvd"
    ss.city = "Villa Park"
    ss.state = "CA"
    ss.zip_code = "92861"
    ss.phone_number = "714-637-4845"
    ss.image = "https://d220aniogakg8b.cloudfront.net/static/uploads/2012/12/21/440f0b34-582_519437_300x300.jpg"
    ss.save
    ss
  end

  before :each do
    visit '/'
    click_link "Contact"
  end

  scenario "user adds information" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("Your message has been sent.")
  end

  scenario "admin gets an email after user submits contact form" do
    @contact = double(name: "John Doe", email: "john@doe.com",
      phone_number: "7145551234", city: "Walnut", message: "This is a message.")
    @email = ContactMailer.new_message(@contact)
    @email.should deliver_to("j3ffhorn@gmail.com")
    @email.should deliver_from("john@doe.com")
    @email.should have_subject("New Message from John Doe")
    @email.should have_body_text(/Name: John Doe/)
    @email.should have_body_text(/Email: john@doe\.com/)
    @email.should have_body_text(/City: Walnut/)
    @email.should have_body_text(/Message: This is a message\./)
  end

  scenario "user can't send message without name" do
    fill_in "contact[name]", with: ""
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Namecan't be blank")
  end

  scenario "user can't send message without email" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: ""
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Emailcan't be blank")
  end

  scenario "user can't send message without phone number" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: ""
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Phone numbercan't be blank")
  end

  scenario "user can't send message without city" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: ""
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Citycan't be blank")
  end

  scenario "user can't send message without message" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: ""
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Message can't be blank")
  end

   scenario "user can't send message with invalid email" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "invalid%email.456"
    fill_in "contact[phone_number]", with: "7145551234"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Emailis invalid")
  end

  scenario "user can't send message with invalid phone number" do
    fill_in "contact[name]", with: "John Doe"
    fill_in "contact[email]", with: "john@doe.com"
    fill_in "contact[phone_number]", with: "9874kjhkjhsd"
    fill_in "contact[city]", with: "Walnut"
    fill_in "contact[message]", with: "This is a message."
    click_button "Submit"
    page.should have_content("There was an error sending your message.")
    page.should have_content("Phone numberis invalid")
  end

  scenario "current Style Seat information on contact page" do
    within("h5") do
      page.should have_content(styleseat.title)
    end
    page.should have_content(styleseat.street_address)
    page.should have_content("#{styleseat.city}, #{styleseat.state} #{styleseat. zip_code}")
    page.should have_content(styleseat.phone_number)
    page.should have_xpath("//img[@src='#{styleseat.image}']")
  end
end
