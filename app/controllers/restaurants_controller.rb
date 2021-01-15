class RestaurantsController < ApplicationController
  def index
    # @restaurants = policy_scope(Restaurant)
    # authorize @restaurants
    @restaurants = Restaurants.all
  end

  def new
    @restaurant = Restaurant.new
    # authorize @restaurant
  end

  def create
    url = "http://localhost:3000/api/v1/restaurants"
    request = { restaurant: restaurant_params.to_json.to_s }.to_json
    RestClient.post url, request, { content_type: :json, accept: :json, :'X-User-Email' => 'test@test.com', :'X-User-Token' => "GGGbs5Z59s2qgWhyBpbH"}
  end

  def edit
  end

  def update
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
