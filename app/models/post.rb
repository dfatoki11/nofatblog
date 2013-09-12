class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5}
	validates :author, presence: true
	validates :text, presence: true

	attr_accessible :title, :author, :text
end
