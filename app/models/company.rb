class Company < ActiveRecord::Base
  has_many :users
  has_many :locations
  validates :name, :presence => true
end
