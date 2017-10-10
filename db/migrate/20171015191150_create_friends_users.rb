class CreateFriendsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :friends_users do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.references :friend, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
