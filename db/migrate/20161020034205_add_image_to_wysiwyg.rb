class AddImageToWysiwyg < ActiveRecord::Migration
  def change
    add_column :wysiwygs, :image, :string
  end
end
