class CreatePostChunk < ActiveRecord::Migration
  def change
    create_table :post_chunks do |t|
      t.string :name
      t.string :description
      t.references :post, index: true, foreign_key: true
      t.attachment :image

      t.timestamps
    end
  end
end
