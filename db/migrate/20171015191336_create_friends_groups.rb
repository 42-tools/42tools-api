class CreateFriendsGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :friends_groups do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :name

      t.timestamps
    end
  end
end
