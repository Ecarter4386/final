class ApplicationController < ActionController::Base
	before_action :categories
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden}
			format.html { redirect_to products_path, :alert => "Not authorized!"}
				end
			end

	def categories
		@categories = Category.order(:name)
	end

	def current_order
		if !session[:order_id].nil?
			Order.find(session[:order_id])
		else
			Order.new
		end
	end

	
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

end
