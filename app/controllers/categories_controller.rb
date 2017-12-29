class CategoriesController < ApplicationController
   expose(:category)
   expose(:posts) { category.posts.visible.paginate(:per_page => 10, :page => params[:page]) }
end
