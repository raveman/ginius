class UsersController < ApplicationController
  before_action :authenticate_user!

	def index
		if current_user.admin? 
	  		@users = User.all
		end
	end
end
