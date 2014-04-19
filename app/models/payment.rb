class Payment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :payer, class_name: "User"
end
