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
    @fullname = '' #start with a blank to avoid nil problems in the view
    if !self.first_name.nil?
      # if first name, append it
      @fullname += self.first_name
      if @fullname.length && !self.last_name.nil? && self.last_name.length
        # if there's also a last name, make a space for it
        @fullname += ' '
      end
    end

    if !self.last_name.nil?
      @fullname += self.last_name
    end

    return @fullname
  end
end
