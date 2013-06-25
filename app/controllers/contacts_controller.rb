require 'opengraph'

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @style_seat = OpenGraph.fetch("https://www.styleseat.com/katpark")
  end
end
