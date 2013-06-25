class HomeController < ApplicationController
  def index
    @featured = Post.featured.first
  end
end
