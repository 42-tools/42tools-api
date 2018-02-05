class CreateFortytwoTitlesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_titles_users do |t|
      t.references :title, foreign_key: { to_table: :fortytwo_titles }
      t.references :user, foreign_key: { to_table: :fortytwo_users }
      t.boolean :selected

      t.timestamps
    end
  end
end
