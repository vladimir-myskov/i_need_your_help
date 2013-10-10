class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :status

      t.timestamps
    end

    Status.create :status => "Waiting for Staff Response"
    Status.create :status => "Waiting for Customer"
    Status.create :status => "On Hold"
    Status.create :status => "Cancelled"
    Status.create :status => "Completed"
  end

  def self.down
    drop_table :statuses
  end
end  