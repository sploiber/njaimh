class AddEndorsementLevelToMembers < ActiveRecord::Migration
  def change
    add_column :members, :endorsement_level_id, :integer, :references => "endorsement_levels"
    add_index :members, :endorsement_level_id

  end
end
