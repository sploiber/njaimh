class DropAreasOfPractice < ActiveRecord::Migration
  def change
    drop_table :areas_of_practice do |t|
      t.string :name, :limit => 20, :unique => true

      t.timestamps
    end
  end
end
