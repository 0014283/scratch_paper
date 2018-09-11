class PaperImage < ApplicationRecord
	belongs_to :paper
	attachment :image

	validates :image, presence: true

end
