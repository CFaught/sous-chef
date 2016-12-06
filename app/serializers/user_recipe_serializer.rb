class UserRecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :yield, :content
  has_one :user, serializer: UserSerializer
end
