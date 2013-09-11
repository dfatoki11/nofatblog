class PostsController < ApplicationController
	def new
	end

	def create
		@post = Post.create(params[:post].permit(:title, :author, :text))

		if @post.save!
			redirect_to @post
		else
			render action: :new
		end
		
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts =Post.all 
	end

	private
		def post_params
			params.require(:post).permit(:title, :author, :text)
		end



end
