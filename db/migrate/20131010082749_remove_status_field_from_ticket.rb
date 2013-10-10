class RemoveStatusFieldFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :status
  end
end
