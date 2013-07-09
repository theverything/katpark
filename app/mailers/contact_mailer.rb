class ContactMailer < ActionMailer::Base

  def new_message(contact)
    @name = contact.name
    @email = contact.email
    @city = contact.city
    @message = contact.message

    mail to: "j3ffhorn@gmail.com", from: @email, subject: "New Message from #{@name}"
  end
end
