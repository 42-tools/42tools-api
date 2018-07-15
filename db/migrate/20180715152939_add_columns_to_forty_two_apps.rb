class AddColumnsToFortyTwoApps < ActiveRecord::Migration[5.1]
  def change
    add_column :fortytwo_apps, :description, :text
    add_column :fortytwo_apps, :website, :string
    add_column :fortytwo_apps, :image_url, :string
    add_column :fortytwo_apps, :public, :boolean
    add_column :fortytwo_apps, :scopes, :text
  end
end
