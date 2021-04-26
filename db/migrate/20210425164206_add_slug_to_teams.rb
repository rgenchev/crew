class AddSlugToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :slug, :string
  end
end
