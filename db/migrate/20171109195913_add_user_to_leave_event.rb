class AddUserToLeaveEvent < ActiveRecord::Migration
  def change
    add_reference :leave_events, :user, index: true, foreign_key: true
  end
end
