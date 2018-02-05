class CreateFortytwoAchievementsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :fortytwo_achievements_users do |t|
      t.references :achievement, foreign_key: { to_table: :fortytwo_achievements }
      t.references :user, foreign_key: { to_table: :fortytwo_users }

      t.timestamps
    end
  end
end
