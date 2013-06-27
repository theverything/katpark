class StyleSeat < ActiveRecord::Base
  attr_accessible :city, :state, :street_address, :title, :zip_code, :phone_number
end
