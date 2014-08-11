class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.timestamps
    end

    create_table :projects_users, id: false do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.timestamps
    end
  end
end
