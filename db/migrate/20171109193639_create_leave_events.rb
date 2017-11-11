class CreateLeaveEvents < ActiveRecord::Migration
  def change
    create_table :leave_events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :leave_apply_date
      t.string :reason_for_leave
      t.string :status, default: "pending"
      t.string :reporting_head_name
      t.boolean :leave_status

      t.timestamps null: false
    end
  end
end
