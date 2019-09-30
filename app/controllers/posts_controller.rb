class PostsController < ApplicationController
  caches_page :show, :index
  expose :post, find_by: :slug
  expose(:posts_presenter) { PostsDecorator.decorate(posts_filter) }
  expose(:user) { post.user }

  private

  def posts_filter
    params[:search] ? Post.search(params[:search]).public(params[:page]) : Post.public(params[:page])
  end
end
