class AddUidAndSecretColumnToFortytwoApps < ActiveRecord::Migration[5.1]
  def change
    add_column :fortytwo_apps, :uid, :string
    add_column :fortytwo_apps, :secret, :string
  end
end
