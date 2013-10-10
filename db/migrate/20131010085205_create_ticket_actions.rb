class CreateTicketActions < ActiveRecord::Migration
  def change
    create_table :ticket_actions do |t|
      t.string :comment
      t.references :ticket
      t.references :user
      t.references :status
      t.references :owner

      t.timestamps
    end
    add_index :ticket_actions, :ticket_id
    add_index :ticket_actions, :user_id
    add_index :ticket_actions, :status_id
  end
end
