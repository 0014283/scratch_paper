class PaperImage < ApplicationRecord

	attachment :image

	belongs_to :paper_album
end
