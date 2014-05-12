class User < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company
  belongs_to :role
  has_many :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def fullname
    @fullname = ''
    @fullname += self.first_name
    if !@fullname.nil? && @fullname.length && self.last_name.length
      @fullname += ' '
    end
    @fullname += self.last_name
    return @fullname
  end
end
