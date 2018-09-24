class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

	before_action :request_path

	def after_sign_in_path_for(resource)

		my_list_user_url(resource)

	end


	def request_path
		@path = controller_path + '#' + action_name
		def @path.is(*str)
			str.map{|s| self.include?(s)}.include?(true)
		end
	end

	protected
    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end
end
