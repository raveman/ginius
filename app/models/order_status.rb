class OrderStatus < ActiveRecord::Base

	def self.statuses
		{ new: 0, in_progress: 1, done: 2, updated: 3, declined: -1}
	end

	def self.description
		{ new: "новый", in_progress: "в обработке", done: "выполнен", updated: "обновлен", declined: "отклонен"}

	end
end
