class Contact < ActiveRecord::Base
  attr_accessible :city, :email, :message, :name, :phone_number
end
