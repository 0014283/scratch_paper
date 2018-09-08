class PaperAlbum < ApplicationRecord

	validates :paper, presence: true

	belongs_to :paper
	has_many :paper_images, dependent: :destroy
end
