class Profile < ActiveRecord::Base
  # belongs_to :user
  has_many :orders
  # belongs_to :order
  validates :first_name, presence: true
  validates :phone, presence: true#, format: { with: /^(\+77\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$/ }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
