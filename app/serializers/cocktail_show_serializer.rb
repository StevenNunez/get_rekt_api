class CocktailShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :source, :proportions

  def proportions
    object.proportions.map do |proportion|
      "#{proportion.amount} #{proportion.ingredient.name}"
    end
  end
end
