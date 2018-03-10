class RenameFortytwoProjectsUsersCursusFromFortytwoCursusProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :fortytwo_projects_users_cursus, :fortytwo_cursus_projects_users
  end
end
