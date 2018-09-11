class PapersController < ApplicationController


	def index
		@papers = Paper.all
		@paper_images = PaperImage.all
	end

	def new
		@paper = Paper.new
		@paper.paper_images.build
	end

	def show
		@paper = Paper.find(params[:id])
		@genres = Genre.all
	end

	def create
		@paper = Paper.new(paper_params)
		@user = current_user
		@paper.user_id = @user.id
		if @paper.save
			redirect_to my_list_user_path(@user.id)
		else
			render :new
		end
	end

	def destroy
		@paper = Paper.find(params[:id])
		@user = @paper.user
		@paper.destroy
		redirect_to my_list_user_path(@user.id)
	end



	private

	def paper_params
		params.require(:paper).permit(:title,:content,:user_id,:genre_id,:start_date,:end_date, paper_images_attributes: [:id, :image, :paper_id, :_destroy]
			)
	end
end
