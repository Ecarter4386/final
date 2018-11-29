class ApplicationController < ActionController::Base
	before_action :categories
	def categories
		@categories = Category.order(:name)
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

end
