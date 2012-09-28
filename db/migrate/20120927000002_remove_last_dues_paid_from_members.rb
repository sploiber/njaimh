class RemoveLastDuesPaidFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :last_dues_paid
  end
end
