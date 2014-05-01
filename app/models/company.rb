class Company < ActiveRecord::Base
  has_many :users
<<<<<<< HEAD
  has_many :locations
=======
  validates :name, :presence => true
>>>>>>> cbb2778275473f7a1e09403237086d26e835fa94
end
