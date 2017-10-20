class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :users
	has_many :wysiwygs
	has_many :comments

	validates :title, presence: true
	validates :category_id, presence: true
	validates :body, presence: true

	has_attached_file :image,	storage: :s3

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	def self.search(query)
		where("title like ? OR body like?", "%#{query}%","%#{query}%")
	end

	enum state: [:draft, :production]

  def visible?
		return false unless production?
		return true if publish_date.blank?
		return true if publish_date < Time.zone.now
		false
	end

	def self.visible
		Post.where(id: (select { |p| p.visible? }).map(&:id))
	end

	def self.pub_sorted
		order('publish_date DESC','created_at DESC')
	end
end
