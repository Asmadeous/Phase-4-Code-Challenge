class RestaurantsController < ApplicationController
   
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index#(GET /restaurants)
        restaurants = Restaurant.all
        render json: restaurants
    end

    def show#(GET /restaurants/:id)
        restaurant = Restaurant.includes(:pizzas).find(params[:id])
        render json: restaurant, include: { pizzas: { only: [:id, :name, :ingredients] } }
    end

    def destroy#(DELETE /restaurants/:id)
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content
    end

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
      end
end
