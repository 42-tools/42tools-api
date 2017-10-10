class CreateProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_users do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :occurrence
      t.integer :final_mark
      t.string :status
      t.boolean :validated

      t.timestamps
    end
  end
end
