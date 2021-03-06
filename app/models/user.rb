class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_recipes
  has_many :favorites, through: :user_recipes, source: :recipe
  has_many :shopping_lists
  has_many :items, through: :shopping_lists, source: :ingredient
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]


  def self.from_omniauth(auth)
    p auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save
    end
  end
end
