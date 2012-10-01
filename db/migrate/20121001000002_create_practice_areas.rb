class CreatePracticeAreas < ActiveRecord::Migration
  def change
    create_table :practice_areas do |t|
      t.string :name, :limit => 20, :unique => true

      t.timestamps
    end
  end
end
