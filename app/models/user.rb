class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_and_belongs_to_many :role
	has_many :order

	before_create :set_default_role

 	def admin?
 		self.role.each do |role|
			if role.name = :admin
				return true
			end
 		end
		return false
	end

	def client?
 		self.role.each do |role|
			if role.name = :registered
				return true
			end
 		end
		return false	end

	def manager?
	 		self.role.each do |role|
			if role.name = :manager
				return true
			end
 		end
		return false
	end

	private
	def set_default_role
		self.role ||= Role.find_by_name('registered')
	end

end
