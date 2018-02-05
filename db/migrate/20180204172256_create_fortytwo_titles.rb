class CreateFortytwoTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_titles do |t|
      t.string :name

      t.timestamps
    end
  end
end
