class AddColumnsToFortytwoCursusUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :fortytwo_cursus_users, :grade, :string
    add_column :fortytwo_cursus_users, :level, :integer
    add_column :fortytwo_cursus_users, :begin_at, :datetime
    add_column :fortytwo_cursus_users, :end_at, :datetime
    add_column :fortytwo_cursus_users, :has_coalition, :boolean
  end
end
