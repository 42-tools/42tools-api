class AddTitleColumnToFortytwoAchievements < ActiveRecord::Migration[5.1]
  def change
    add_reference :fortytwo_achievements, :title, foreign_key: { to_table: :fortytwo_titles }
  end
end
