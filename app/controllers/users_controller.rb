class UsersController < ApplicationController

	before_action :authenticate_user!, only:[:my_list, :following, :followers]

	def my_list
		@user= User.find(params[:id])
		@papers = @user.papers.all
		@paper_images = PaperImage.all
	end

	def interest_list
		@user= User.find(params[:id])
		@paper_images = PaperImage.all
	end

	def following_list
		@user= User.find(params[:id])
		@users = @user.followings
		@paper_images = PaperImage.all
	end

	def following
		@user= User.find(params[:id])
		@users = @user.followings
		render 'following'
	end

	def followers
		@user= User.find(params[:id])
		@users = @user.followers
		render 'followers'
	end

	def edit
		@user= User.find(params[:id])
	end

	def update
		@user= User.find(params[:id])
		if @user.update(user_params)
			redirect_to my_list_user_path(@user)
		end
	end


	private

	def user_params
		params.require(:user).permit(:name,:email,:privacy,:user_image,:content)
	end
end
