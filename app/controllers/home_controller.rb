class HomeController < ApplicationController
  def index
    @featured = Post.featured.first
  end

  def about
    @style_seat = StyleSeat.first
  end
end
