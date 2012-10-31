class AddSecondaryPracticeAreaToMembers < ActiveRecord::Migration
  def change
    add_column :members, :secondary_practice_area_id, :integer, :references => "practice_areas"
    add_index :members, :secondary_practice_area_id

  end
end
