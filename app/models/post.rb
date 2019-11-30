class Post < ActiveRecord::Base
	extend FriendlyId
	extend PagedSearchable

  friendly_id :title, use: :slugged
	belongs_to :category
	belongs_to :user
	has_many :wysiwygs
	has_many :comments
	has_many :post_chunks

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

	def self.public(page)
		visible.pub_sorted.paginate(:per_page => 10, :page => page)
	end

	def self.visible
		Post.where(id: (select { |p| p.visible? }).map(&:id))
	end

	def self.pub_sorted
		order('job_priority','publish_date DESC NULLS LAST','created_at DESC')
	end

	def visible_published_date
		return publish_date unless publish_date.blank?
		created_at.to_time
	end

	def root_comments
		comments.where(reply_comment: nil)
	end
end
