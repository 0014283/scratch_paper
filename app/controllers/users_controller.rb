class UsersController < ApplicationController

	before_action :authenticate_user!, only:[:edit, :update]
	before_action :authenticate_admin!, only:[:admin_index]

	def my_list
		@user= User.find(params[:id])
		@papers = @user.papers.all
		@paper_images = PaperImage.all
	end

	def interest_list
		@user= User.find(params[:id])
		@paper_images = PaperImage.all
		if user_signed_in?
			if @user.id == current_user.id
			else
				redirect_to my_list_user_path(@user)
			end
		else
			redirect_to my_list_user_path(@user)
		end
	end

	def following_list
		@user= User.find(params[:id])
		@users = @user.followings
		@paper_images = PaperImage.all
		if user_signed_in?
			if @user.id == current_user.id
			else
				redirect_to my_list_user_path(@user)
			end
		else
			redirect_to my_list_user_path(@user)
		end
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
		if @user.id == current_user.id
		else
			redirect_to my_list_user_path(@user)
		end
	end

	def update
		@user= User.find(params[:id])
		if @user.id == current_user.id
			@user.update(user_params)
			redirect_to my_list_user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		if admin_signed_in?
			@user.destroy
			redirect_to users_admin_index_path
		elsif @user.id == current_user.id
			@user.destroy
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def admin_index
		@users = User.all
	end


	private

	def user_params
		params.require(:user).permit(:name,:email,:privacy,:user_image,:content)
	end
end
