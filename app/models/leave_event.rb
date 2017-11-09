class LeaveEvent < ActiveRecord::Base
	belongs_to :user
    before_create :key_generating
    validates_presence_of :start_date, :end_date, :apply_leave_date, :reporting_head_name

	STATUS = %i{pending approved rejected cancelled}.freeze

	def check(manager)
	 	return false if manager.nil? && !verify?
	 	update_columns(manager_id: manager.id, status: "approved")
	end

	def cancel(manager)
		return false if manager.nil? && !verify?
		update_columns(manager_id:manager.id, status: "rejected")
	end

	def verify?
		status == "pending"
	end

	def key_generating
		self.key = SecureRandom.hex(5).lowcase
	end
end
