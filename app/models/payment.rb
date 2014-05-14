class Payment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :payer, class_name: "User"
  has_many :appointments
  has_many :users
  has_many :services

end
