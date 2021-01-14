class RestaurantsController < ApplicationController
  def index
    @restaurants = policy_scope(Restaurant)
    authorize @restaurants
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
