class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.bigint :parent_id

      t.timestamps
    end
    add_index :projects, :parent_id
  end
end
