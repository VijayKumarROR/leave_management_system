class AddManagerToLeaveEvent < ActiveRecord::Migration
  def change
    add_reference :leave_events, :manager, index: true, foreign_key: true
  end
end
