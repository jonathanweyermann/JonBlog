class AddJobPriorityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :job_priority, :integer, default: 1
  end
end
