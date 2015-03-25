class Order < ActiveRecord::Base
	belongs_to :client, class_name: "User"
	belongs_to :operator, class_name: "User"

	# TODO add validations
	def date_and_time_created
		self.created_at.strftime("%d.%m.%Y в %H:%M")
	end	

end
