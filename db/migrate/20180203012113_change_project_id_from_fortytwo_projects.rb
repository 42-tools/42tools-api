class ChangeProjectIdFromFortytwoProjects < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :fortytwo_projects, :fortytwo_projects, column: :parent_id
  end
end
