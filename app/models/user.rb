class User < ApplicationRecord
	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :user_image

         validates :name, presence: true
         validates :email, presence: true, uniqueness: true

         has_many :interests, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", dependent: :destroy, foreign_key: "follower_id"
         has_many :active_relationships, class_name: "Relationship", dependent: :destroy, foreign_key: "following_id"
         has_many :following, through: :active_relationships, source: :following
         has_many :followers, through: :passive_relationships, source: :follower
         has_many :paper, dependent: :destroy
end
