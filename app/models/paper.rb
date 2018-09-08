class Paper < ApplicationRecord

	belongs_to :user
	belongs_to :genre
	has_many :likes, dependent: :destroy
	has_many :interests, dependent: :destroy
	has_one :paper_album, dependent: :destroy
end
