class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity
end
