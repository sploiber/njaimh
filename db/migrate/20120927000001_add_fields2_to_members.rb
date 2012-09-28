class AddFields2ToMembers < ActiveRecord::Migration
  def change
    add_column :members, :work_extension, :string
    add_column :members, :county, :string

  end
end
