class Post < ActiveRecord::Base
	validates :title, presence: true,
					  length: { minimum: 5}
	validates :author, presence: true
	validates :text, presence: true
end
