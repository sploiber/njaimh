class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :agency
      t.string :address_1
      t.string :address_2
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.string :work_phone
      t.string :home_phone
      t.string :email_1
      t.string :email_2
      t.boolean :board_member
      t.string :board_position
      t.string :memo
      t.string :fax_number
      t.boolean :org_member, :default => false
      t.string :work_extension
      t.string :county
      t.string :dues_paid_year
      t.string :org_member_type
      t.string :title_credential

      t.timestamps
    end
  end
end
