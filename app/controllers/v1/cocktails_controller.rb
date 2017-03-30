class V1::CocktailsController < ApplicationController
  def index
    cocktails = Cocktail.all
    render json: cocktails
  end

  def show
    cocktail = Cocktail.includes(:ingredients).find(params[:id])
    render json: cocktail, serializer: CocktailShowSerializer
  end
end
