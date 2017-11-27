class PostsController < ApplicationController
  expose :post, find_by: :slug
  #expose :comment, scope: ->{ Post.find_by(slug: params[:id] ).commentss }
#  expose :comment, scope: ->{ post.comments }, id: ->{ params[:comment_id] }

  def index
    if params[:search]
      @posts = Post.search(params[:search]).visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
  	end
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
end
