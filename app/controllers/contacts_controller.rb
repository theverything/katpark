class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @style_seat = StyleSeat.first
  end

  def create
    @style_seat = StyleSeat.first
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Your message has been sent."
      redirect_to new_contact_path
    else
      flash[:alert] = "There was an error sending your message."
      render "new"
    end
  end
end
