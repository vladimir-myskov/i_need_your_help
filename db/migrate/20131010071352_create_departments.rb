class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end

    Department.create :name => "Development"
    Department.create :name => "Design"
  end

  def self.down
  	drop_table :departments

  end
end
