class AddMemoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :memo, :string, :default => ""
  end
end
