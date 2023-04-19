class Chefs::IngredientsController < ApplicationController
  def index
    @chefs = Chef.all
  end
end