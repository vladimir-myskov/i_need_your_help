class AddDepartmentIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :department_id, :integer
    add_index :tickets, :department_id
  end
end
