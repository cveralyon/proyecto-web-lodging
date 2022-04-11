class PagesController < ApplicationController
  def home
    @home_lodgings = Lodging.all.sample(3)
    @home_reviews = ReviewLodging.all.includes(:user).sample(3)
  end
end
