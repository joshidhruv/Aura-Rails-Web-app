class User < ActiveRecord::Base
  #attr_accessible :company_attributes

  belongs_to :company
  accepts_nested_attributes_for :company

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
