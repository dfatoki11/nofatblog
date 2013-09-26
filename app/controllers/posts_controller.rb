class PostsController < ApplicationController


	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:title, :author, :text))

		if @post.save
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :author, :text))
			redirect_to @post
		else
			render action: :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
      	
	end

	private
		def post_params
			params.require(:post).permit(:title, :author, :text)
		end



end
