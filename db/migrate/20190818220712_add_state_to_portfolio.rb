class AddStateToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :state, :integer
  end
end
