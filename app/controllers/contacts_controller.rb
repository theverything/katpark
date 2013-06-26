class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @style_seat = StyleSeat.first
  end
end
