class UsersController < ApplicationController
	before_action :request_path


	def request_path
		@path = controller_path + '#' + action_name
		def @path.is(*str)
			str.map{|s| self.include?(s)}.include?(true)
		end
	end

	def my_list
		@user= User.find(params[:id])
	end

	def interest_list
		@user= User.find(params[:id])
	end

	def following_list
		@user= User.find(params[:id])
	end

	def following
		@user= User.find(params[:id])
	end

	def followers
		@user= User.find(params[:id])
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
