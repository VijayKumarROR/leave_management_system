class LeaveEventsController < ApplicationController
	before_action :authenticate_user!

	def new
		@leave = LeaveEvent.new
	end

	def create
		@leave = current_user.leave_events.build(leave_params)
		if @leave.save
			p @leave
			flash[:notice] = "New Leave Has Been Saved"
			redirect_to leave_events_path
		else
			render "new"
		end
	end

	def index
		@use = current_user
		@leave = LeaveEvent.all
	end

	def show
		@leave = LeaveEvent.find_by_key(params[:id]) 
	end

	def check
		chck = LeaveEvent.find_by_key(params[:id])
		if chck.verify(current_user)
			redirect_to :controller => "welcome", :action => "index"
			else
			redirect_to :controller => "welcome", :action => "index"
		end
	end

	def cancel
		chck = LeaveEvent.find_by_key(params[:id])

		if chck.cancel(current_user)
			redirect_to :controller => "welcome", :action => "index"
		else
			redirect_to :controller => "welcome", :action => "index"
		end
	end

private
	def leave_params
		params.require(:leave_event).permit(:start_date,:end_date,:leave_apply_date,:reason_for_leave,:reporting_head_name, :leave_status)
	end

end
