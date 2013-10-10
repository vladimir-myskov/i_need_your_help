class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :username
      t.string :email
      t.string :subject
      t.text :body
      t.string :token
      t.string :status

      t.timestamps
    end
  end
end
