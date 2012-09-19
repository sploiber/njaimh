class AddFieldsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :fax_number, :string
    add_column :members, :org_member, :boolean, :default => false

  end
end
