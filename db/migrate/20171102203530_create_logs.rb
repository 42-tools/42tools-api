class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.references :linkable, polymorphic: true
      t.text :data

      t.timestamps
    end
  end
end
