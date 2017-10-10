class CreateCursus < ActiveRecord::Migration[5.1]
  def change
    create_table :cursus do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
