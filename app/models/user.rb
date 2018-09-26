class User < ApplicationRecord
	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :user_image

         validates :name, presence: true, length: { maximum:12 }
         validates :email, presence: true, uniqueness: true
         validates :content, length: { maximum:297 }

         has_many :papers, dependent: :destroy

         has_many :interests, dependent: :destroy
         has_many :interested_papers, through: :interests, source: :paper

         has_many :likes, dependent: :destroy
         has_many :liked_papers, through: :likes, source: :paper

         has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
         has_many :followings, through: :following_relationships

         has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
         has_many :followers, through: :follower_relationships

        def following?(other_user)
          following_relationships.find_by(following_id: other_user.id)
        end

        def follow!(other_user)
          following_relationships.create!(following_id: other_user.id)
        end

        def unfollow!(other_user)
          following_relationships.find_by(following_id: other_user.id).destroy
        end

end
