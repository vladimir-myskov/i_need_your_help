class AddProgressToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :progress, :string

    Status.find_by_status("Waiting for Staff Response").update_attributes(:progress => "opened")
    Status.find_by_status("Waiting for Customer").update_attributes(:progress => "opened")
    Status.find_by_status("On Hold").update_attributes(:progress => "hold")
    Status.find_by_status("Cancelled").update_attributes(:progress => "closed")
    Status.find_by_status("Completed").update_attributes(:progress => "closed")    
  end

  def self.down
    remove_column :statuses, :progress
  end
end
