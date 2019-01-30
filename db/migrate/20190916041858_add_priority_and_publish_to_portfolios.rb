class AddPriorityAndPublishToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :priority, :integer
    add_column :portfolios, :publish, :integer
  end
end
