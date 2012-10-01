class AddPracticeAreaToMembers < ActiveRecord::Migration
  def change
    add_column :members, :practice_area_id, :integer, :references => "practice_areas"
    add_index :members, :practice_area_id

  end
end
