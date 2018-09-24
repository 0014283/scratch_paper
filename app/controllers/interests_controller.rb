class InterestsController < ApplicationController

	before_action :authenticate_user!

	def create
		@paper = Paper.find(params[:paper_id])
		@interest = current_user.interests.new(paper_id: @paper.id)
		@interest.save
		@paper.reload
		respond_to do |format|
  	      format.html { render @paper }
  	      format.js
  	    end
	end
	def destroy
		@paper = Paper.find(params[:paper_id])
		@interest = current_user.interests.find_by(paper_id: params[:paper_id])
		@interest.destroy
		@paper.reload
		respond_to do |format|
  	      format.html { render @paper }
  	      format.js
  	    end
	end

end
