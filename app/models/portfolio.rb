class Portfolio < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
	has_many :portfolio_chunks

	has_attached_file :image,	storage: :s3,
	  styles: {
      thumb: "100x100",
      small: "400x400",
      medium: "1400x1400"
		}

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	enum publish: [:not_published, :is_published]

  def visible?
		return true if is_published?
	end

	def self.sorted_public
		visible.priority
	end

	def self.visible
		Portfolio.where(id: (select { |p| p.visible? }).map(&:id))
	end

	def self.priority
		order('priority','created_at DESC')
	end
end
