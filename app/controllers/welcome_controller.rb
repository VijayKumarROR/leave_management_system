class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@pending = current_user.leave_events.where(status: "pending")
		@completed = current_user.leave_events.completed
	end
end
