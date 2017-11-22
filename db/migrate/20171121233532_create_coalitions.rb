class CreateCoalitions < ActiveRecord::Migration[5.1]
  def change
    create_table :coalitions do |t|
      t.string :name
      t.string :slug
      t.text :image_url
      t.string :color
      t.integer :score
      t.references :master, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
