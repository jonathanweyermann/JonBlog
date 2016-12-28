class CreateWysiwyg < ActiveRecord::Migration
  def change
    create_table :wysiwygs do |t|
      t.string :name
      t.integer :post_id

      t.timestamps
    end
  end
end
