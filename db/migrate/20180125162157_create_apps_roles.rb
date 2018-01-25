class CreateAppsRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :apps_roles do |t|
      t.references :app, foreign_key: true
      t.integer :slug

      t.timestamps
    end
  end
end
