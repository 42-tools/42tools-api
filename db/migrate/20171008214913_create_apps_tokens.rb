class CreateAppsTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :apps_tokens do |t|
      t.references :app, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
