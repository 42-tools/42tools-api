class CreateProjectsUsersCursus < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_users_cursus do |t|
      t.references :projects_user, foreign_key: true
      t.references :cursus, foreign_key: true

      t.timestamps
    end
  end
end
