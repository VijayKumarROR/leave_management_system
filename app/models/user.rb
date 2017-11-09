class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :leave_events

  ROLES = %i{manager employee}.freeze

	def manager?
		role == "manager"
	end

	def employee?
		role == "employee"
	end
end
