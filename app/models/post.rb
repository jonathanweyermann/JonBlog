class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :users
	has_many :wysiwygs
	has_many :comments

	validates :title, presence: true
	validates :category_id, presence: true
	validates :body, presence: true

	has_attached_file :image,	storage: :s3
									#:s3_credentials => Proc.new{|a| a.instance.s3_credentials }

	#def s3_credentials
	#	{
	#		bucket: Rails.configuration.image_bucket,
	#		access_key_id: Rails.configuration.aws_access_key,
	#		secret_access_key: Rails.configuration.aws_secret_key,
	#		s3_region: Rails.configuration.aws_region
	#	}
	#end

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	def self.search(query)
		where("title like ? OR body like?", "%#{query}%","%#{query}%")
	end
	enum state: [:draft, :production]
end
