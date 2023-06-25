class PizzasController < ApplicationController
    def index#(GET /pizzas)
        pizzas = Pizza.all
        render json: pizzas, only: [:id, :name, :ingredients]
    end

end
