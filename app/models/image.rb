class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :avatar
  has_attached_file :avatar, styles: { meduim: "300x300>", thumb: "100x100>" }

  validates :avatar, presence: true
end
