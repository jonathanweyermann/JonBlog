class Wysiwyg < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, ImageUploader

  attr_accessor :filename
end
