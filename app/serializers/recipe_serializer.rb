class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :yield, :content
  has_many :ingredients, serializer: RecipeIngredientSerializer
end
