class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@pending = current_user.leave_events.where(leave_status: false)
		@completed = current_user.leave_events(leave_status: "completed")
	end
end
