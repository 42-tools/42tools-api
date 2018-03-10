class CreateFortyTwoLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_languages do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
