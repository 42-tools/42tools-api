class CreateFortytwoAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_achievements do |t|
      t.string :name
      t.text :description
      t.string :tier
      t.string :kind
      t.boolean :visible
      t.text :image
      t.integer :nbr_of_success
      t.references :parent, foreign_key: { to_table: :fortytwo_achievements }

      t.timestamps
    end
  end
end
