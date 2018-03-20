class CreateFortytwoLanguagesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_languages_users do |t|
      t.references :language, foreign_key: { to_table: :fortytwo_languages }
      t.references :user, foreign_key: { to_table: :fortytwo_users }
      t.integer :position

      t.timestamps
    end
  end
end
