class OrderStatus < ActiveRecord::Base

	def self.statuses
		{ 
			new: 0,
			processing: 1,
			tarification: 2, 
			negotiation: 3,
			waiting_for_payment: 4,
			in_progress: 5,
		 	done: 6,
		 	waiting_for_raiting: 7,
		 	closed: 9, 
		 	declined: -1
		}
	end

	def self.description
		{ 
			new: "новый",
			processing: "обработка",
			tarification: "тарификация", 
			negotiation: "согласование",
			waiting_for_payment: "ожидание оплаты",
			in_progress: "в работе",
		 	done: "исолпнен",
		 	waiting_for_raiting: "ожидает рейтинга",
		 	closed: "завершен", 
		 	declined: "отклонен"
		}

	end
end
