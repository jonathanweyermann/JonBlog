class User < ActiveRecord::Base
  extend PagedSearchable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :posts

	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true, on: :create
	validates :password, confirmation: true, on: :create

	def self.search(query)
		where("name like ? OR email like?", "%#{query}%","%#{query}%")
	end
end
