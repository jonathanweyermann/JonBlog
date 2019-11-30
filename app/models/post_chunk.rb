class PostChunk < ActiveRecord::Base
	belongs_to :post

	has_attached_file :image,	storage: :s3,
	  styles: {
      thumb: "100x100",
      small: "400x400",
      medium: "1400x1400"
		}

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
