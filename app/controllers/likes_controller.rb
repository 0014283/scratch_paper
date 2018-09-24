class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		@paper = Paper.find(params[:paper_id])
		@like = current_user.likes.new(paper_id: @paper.id)
		@like.save
		@paper.reload
		respond_to do |format|
  	      format.html { render @paper }
  	      format.js
  	    end
	end
	def destroy
		@paper = Paper.find(params[:paper_id])
		@like = current_user.likes.find_by(paper_id: params[:paper_id])
		@like.destroy
		@paper.reload
		respond_to do |format|
  	      format.html { render @paper }
  	      format.js
  	    end
	end

end
