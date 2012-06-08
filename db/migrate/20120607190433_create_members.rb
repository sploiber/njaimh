class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :agency
      t.string :address
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.string :work_phone
      t.string :home_phone
      t.string :email
      t.date :last_dues_paid
      t.boolean :board_member

      t.timestamps
    end
  end
end
