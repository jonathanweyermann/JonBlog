class Wysiwyg < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, ImageUploader

	before_save :update_image_attributes
  attr_accessor :filename

  private
		def update_image_attributes
      #binding.pry
			#if image.present? && image_changed?
      #  self.image.file.content_type = filename.split(".").last
			#end
    end

end
