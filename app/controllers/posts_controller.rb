class PostsController < ApplicationController
  expose :post, find_by: :slug
  expose(:posts) { posts_filter }

  def index

  	@categories = Category.all
    @users = User.all
  end

  def show
    @comment = post.comments.build

  	@categories = Category.all
    @post = Post.friendly.visible.find(params[:id])
    @user = User.find(@post.user_id)
  	@comment = Comment.new
  	@comments = Comment.all
  end

  private

  def posts_filter
    params[:search] ? Post.search(params[:search]).public(params[:page]) : Post.public(params[:page])
  end
end
