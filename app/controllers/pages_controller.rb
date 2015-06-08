class PagesController < ApplicationController
	def home
		@order = Order.new
		@profile = @order.build_profile
		# @profile = Profile.new
		# @order = @profile.order.build
	end

	def contacts
	end

	def jobs
	end

	def partner
	end

end
