class Contact < ActiveRecord::Base
  attr_accessible :city, :email, :message, :name, :phone_number

  validates :city, :email, :message, :name, :phone_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  VALID_PHONE_REGEX = /\A\+?\d?-?\(?\d{3}\)?-?\d{3}-?\d{4}\z/
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
end
