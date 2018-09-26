class PaperImage < ApplicationRecord
	belongs_to :paper
	attachment :image

end
