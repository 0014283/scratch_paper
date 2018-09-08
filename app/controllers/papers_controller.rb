class PapersController < ApplicationController





	private

	def paper_params
		params.require(:paper).permit(:title,:content,:user_id,:genre_id,:start_date,:end_date)
	end
end
