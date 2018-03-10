class CompleteDataFromCompus < ActiveRecord::Migration[5.1]
  def change
    add_column :fortytwo_campus, :time_zone, :string
    add_reference :fortytwo_campus, :language, foreign_key: { to_table: :fortytwo_languages }
  end
end
