class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
    @categories = Category.all
    @posts = @category.posts.visible
    @users = User.all
  end
end
