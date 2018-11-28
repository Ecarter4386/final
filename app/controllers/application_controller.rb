class ApplicationController < ActionController::Base
	def categories
		@categories = Category.order(:name)
	end
end
