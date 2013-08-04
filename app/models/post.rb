class Post < ActiveRecord::Base
  before_save :slugify

  attr_accessible :body, :title, :featured, :author

  validates :body, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true

  scope :featured, where(featured: true).order("created_at DESC").limit(1)

  def slugify
    self.slug = self.title.gsub(/[[:punct:]\|\+\^\$=~`<>]+/, "").parameterize
  end
end
