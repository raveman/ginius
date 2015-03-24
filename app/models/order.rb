class Order < ActiveRecord::Base
	belongs_to :client, class_name: "User"
	belongs_to :operator, class_name: "User"

	# TODO add validations
end
