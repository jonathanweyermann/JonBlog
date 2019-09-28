class Category < ActiveRecord::Base
	extend PagedSearchable

	has_many :posts

	validates :name, presence: true

	def self.search(quote)
		where("name like ?", "%#{query}%")
	end
end
