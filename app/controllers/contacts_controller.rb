class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @style_seat = StyleSeat.first
  end

  def create
    @style_seat = StyleSeat.first
    @contact = Contact.new(params[:contact])
    if @contact.save
      # ContactMailer.delay.new_message(@contact)
      ContactMailer.new_message(@contact).deliver
      flash[:notice] = "Your message has been sent."
      redirect_to new_contact_path
    else
      flash[:alert] = "There was an error sending your message."
      render "new"
    end
  end
end
