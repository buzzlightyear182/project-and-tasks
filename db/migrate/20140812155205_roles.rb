class Roles < ActiveRecord::Migration
  def change
  	add_column :users, :roles, :string, default: "developer"
  end
end
