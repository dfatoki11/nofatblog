class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5}
	validates :author, presence: true
	validates :text, presence: true
	validates :category, presence:true

	attr_accessible :title, :author, :text, :category

	# It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
end
