class CocktailsController < ApplicationController
  def index
    cocktails = Cocktail.all
    render json: cocktails
  end

  def show
    cocktail = Cocktail.includes(proportions: :ingredients).find(params[:id])
    render json: cocktail, serializer: CocktailShowSerializer
  end
end
