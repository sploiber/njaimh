class AddFields3ToMembers < ActiveRecord::Migration
  def change
    add_column :members, :dues_paid_year, :string
    add_column :members, :org_member_type, :string

  end
end
