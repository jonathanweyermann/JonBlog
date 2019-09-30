class AddAttachmentImageToPortfolioChunks < ActiveRecord::Migration
  def self.up
    change_table :portfolio_chunks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :portfolio_chunks, :image
  end
end
