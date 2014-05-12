class Service < ActiveRecord::Base
  belongs_to :company
  has_many :appointments
end
