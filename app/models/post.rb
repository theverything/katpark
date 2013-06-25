class Post < ActiveRecord::Base
  attr_accessible :body, :title, :featured

  validates :body, presence: true
  validates :title, presence: true

  scope :featured, where(featured: true).order("created_at DESC").limit(1)
end
