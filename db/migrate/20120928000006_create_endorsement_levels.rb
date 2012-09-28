class CreateEndorsementLevels < ActiveRecord::Migration
  def change
    create_table :endorsement_levels do |t|
      t.string :name, :limit => 20, :unique => true

      t.timestamps
    end
  end
end
