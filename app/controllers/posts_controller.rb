class PostsController < ApplicationController
  expose(:post)
  expose :comment, parent: :post

  def index
    if params[:search]
      @posts = Post.search(params[:search]).visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
  	end
  	@categories = Category.all
    @users = User.all
  end

  def show
    binding.pry
    comment = post.comments.build

  	@categories = Category.all
  	@post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  	@comment = Comment.new
  	@comments = Comment.all
  end
end
