class AddJobModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jobmode, :boolean, default: false
  end
end
