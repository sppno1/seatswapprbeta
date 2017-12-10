class User < ActiveRecord::Base
  acts_as_messageable
  has_many :tickets
  has_many :searches
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :lockable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :name
  validates_presence_of :ulocation

	def mailboxer_email(object)
	  email
	end        
end