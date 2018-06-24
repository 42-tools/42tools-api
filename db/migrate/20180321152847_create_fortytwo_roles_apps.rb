class CreateFortytwoRolesApps < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_roles_apps do |t|
      t.references :role, foreign_key: { to_table: :fortytwo_roles }
      t.references :app, foreign_key: { to_table: :fortytwo_apps }

      t.timestamps
    end
  end
end
