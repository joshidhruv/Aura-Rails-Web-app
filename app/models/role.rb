class Role < ActiveRecord::Base
  has_many :users

  ROLE_ADMIN = 4
  ROLE_SCHEDULER = 3
  ROLE_STAFF = 2
  ROLE_REGISTERED = 1
end
