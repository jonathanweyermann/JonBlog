class CreatePortfolioChunks < ActiveRecord::Migration
  def change
    create_table :portfolio_chunks do |t|
      t.string :name
      t.string :description
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
