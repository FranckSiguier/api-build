require "uri"
require "net/http"

class RestaurantsController < ApplicationController
  def index
    # @restaurants = policy_scope(Restaurant)
    # authorize @restaurants
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    # authorize @restaurant
  end

  def create
    # url = "http://localhost:3000/api/v1/restaurants"
    # @restaurant = Restaurant.new(restaurant_params)
    # options = {
    #   body: {
    #     restaurant: {
    #       name: @restaurant.name.to_s,
    #       address: @restaurant.address.to_s
    #     }
    #   },
    #   headers: {
    #     "Content-Type": "application/json",
    #     "Accept": "application/json",
    #     "X-User-Email": "test@test.com",
    #     "X-User-Token": "GGGbs5Z59s2qgWhyBpbH"
    #   }
    # }

    # HTTParty.post(url, options)

    url = URI("http://localhost:3000/api/v1/restaurants")
    @restaurant = Restaurant.new(restaurant_params)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["X-User-Email"] = "test@test.com"
    request["X-User-Token"] = "GGGbs5Z59s2qgWhyBpbH"
    request.body = "{\n    \"restaurant\":{\n        \"name\":\"#{@restaurant.name}\",\n        \"address\":\"#{@restaurant.address}\"\n    }\n}"

    response = http.request(request)
    redirect_to api_v1_restaurants_path
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
