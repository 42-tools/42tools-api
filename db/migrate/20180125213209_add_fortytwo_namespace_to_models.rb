class AddFortytwoNamespaceToModels < ActiveRecord::Migration[5.1]
  def change
    rename_table :campus,                :fortytwo_campus
    rename_table :campus_users,          :fortytwo_campus_users
    rename_table :coalitions,            :fortytwo_coalitions
    rename_table :coalitions_users,      :fortytwo_coalitions_users
    rename_table :cursus,                :fortytwo_cursus
    rename_table :cursus_users,          :fortytwo_cursus_users
    rename_table :groups,                :fortytwo_groups
    rename_table :groups_users,          :fortytwo_groups_users
    rename_table :projects,              :fortytwo_projects
    rename_table :projects_users,        :fortytwo_projects_users
    rename_table :projects_users_cursus, :fortytwo_projects_users_cursus
    rename_table :users,                 :fortytwo_users
    rename_table :apps,                  :fortytwo_apps
    rename_table :apps_tokens,           :tokens
    rename_table :apps_roles,            :roles
  end
end
