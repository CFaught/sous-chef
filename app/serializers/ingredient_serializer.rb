class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity
  has_many :recipes
end
