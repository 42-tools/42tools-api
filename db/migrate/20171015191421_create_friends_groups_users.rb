class CreateFriendsGroupsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :friends_groups_users do |t|
      t.references :friends_group, foreign_key: true
      t.references :friends_user, foreign_key: true

      t.timestamps
    end
  end
end
