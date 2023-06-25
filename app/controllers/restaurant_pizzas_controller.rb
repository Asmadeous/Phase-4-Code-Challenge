class RestaurantPizzasController < ApplicationController
   rescue_from ActiveRecord::RecordInvalid, with: :response_unprocessable_entity

   #POST /restaurant_pizzas
   def create
      restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
      render json: restaurant_pizza.pizza, only: [:id, :name, :ingredients]
   end
 
   private
 
   def restaurant_pizza_params
     params.permit(:price, :restaurant_id, :pizza_id)
   end
 
   def response_unprocessable_entity(invalid)
     render json: { "errors": ["validation errors"] }, status: :unprocessable_entity
   end
 end
 