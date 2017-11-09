class AddKeyToLeaveEvent < ActiveRecord::Migration
  def change
    add_column :leave_events, :key, :string
  end
end
