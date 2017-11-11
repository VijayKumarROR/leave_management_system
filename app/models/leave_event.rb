class LeaveEvent < ActiveRecord::Base
	belongs_to :user
    before_create :key_generating
    validates_presence_of :start_date, :end_date, :leave_apply_date, :reporting_head_name
    scope :completed, -> { where.not(status: false) }


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
		leave_status == 'false'
	end

	def key_generating
		self.key = SecureRandom.hex(5).upcase
	end
end
